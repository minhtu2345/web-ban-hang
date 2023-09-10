package com.demo.controller;

import com.demo.service.AccountDao;
import com.demo.model.Account;
import com.demo.model.Order;
import com.demo.model.OrderDetail;
import com.demo.model.Product;
import com.demo.repo.AccountRepo;
import com.demo.repo.OrderDetailRepo;
import com.demo.repo.OrderRepo;
import com.demo.repo.ProductRepo;
import com.demo.service.CartService;
import com.demo.service.CategoryService;
import com.demo.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class UserController {
	@Autowired
	HttpSession session;

	@Autowired
	CategoryService categoryService;

	@Autowired
	ProductService productService;

	@Autowired
	CartService cart;

	@Autowired
	AccountDao accountDao;


	@Autowired
	ProductRepo repo;

	@Autowired
	AccountRepo ac;

	@Autowired
	OrderDetailRepo orderDetailRepo;

	@Autowired
	OrderRepo orderRepo;




	@ModelAttribute("cart")
	CartService getCart(){
		return cart;
	}

	@Data @AllArgsConstructor
	public static class PriceRange{
		int id;
		int minValue;
		int maxValue;
		String display;
	}


	List<PriceRange> priceRangeList = Arrays.asList(
		new PriceRange(0,0, Integer.MAX_VALUE, "Tất cả"),
		new PriceRange(1,0, 10000000, "Dưới 10 triệu"),
		new PriceRange(2,10000000, 20000000, "Từ 10-20 triệu"),
		new PriceRange(3,20000000, Integer.MAX_VALUE, "Trên 20 triệu")
	);

	@RequestMapping("/")
	public String index(
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="") String categoryId,
			@RequestParam(defaultValue="0") Integer  priceRangeId,
			@RequestParam(defaultValue="0") int page,
			@RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw,
			Model model) {

		model.addAttribute("priceRangeList", priceRangeList);
		model.addAttribute("categoryList", categoryService.getAll());
		model.addAttribute("productList", productService.getAll());

		Integer minPrice = priceRangeList.get(priceRangeId).minValue;
		Integer maxPrice = priceRangeList.get(priceRangeId).maxValue;

		System.out.println("keyword=" + keyword);
		System.out.println("categoryId=" + categoryId);
		System.out.println("minPrice=" + minPrice);
		System.out.println("maxPrice=" + maxPrice);
		System.out.println("page=" + page);

		String kwords = kw.orElse((String) session.getAttribute("keywords"));
		kwords = kwords != null? kwords : "";

		session.setAttribute("keywords", kwords);

		Pageable pageable = PageRequest.of(p.orElse(page), 7);
		Page<Product> page1 = null;
		if (categoryId != null && !categoryId.equals("")) {
			 page1 = repo.findByKeywords("%" + kwords + "%", minPrice, maxPrice, categoryId, pageable);
			model.addAttribute("page", page1);

		} else {
			 page1 = repo.findByKeywords2("%" + kwords + "%", minPrice, maxPrice, pageable);
			model.addAttribute("page", page1);

		}

		// TODO: Search & paginate

		return "home/index";
	}

	@GetMapping("/detail/{id}")
	public String viewProduct(@PathVariable int id, Model model) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		return "home/detail";
	}

	@RequestMapping("/add-to-cart/{id}")
	public String addToCart(@PathVariable int id){
		cart.add(id);
		return "redirect:/cart";
	}

	@RequestMapping("/remove-cart/{id}")
	public String removeCart(@PathVariable int id) {
		cart.remove(id);
		if(cart.getTotal() == 0){
			return "redirect:/";
		}
		return "redirect:/cart";
	}

	@RequestMapping("/update-cart/{id}")
	public String updateCart(@PathVariable int id, int quantity) {
		cart.update(id, quantity);
		return "redirect:/cart";
	}

//	đăng ký
	@RequestMapping("/dangky")
	public String account (@ModelAttribute("item")  Account item) {
		return "dangky";
	}

	@RequestMapping("/account/dangky")
	public String dangky(@Validated @ModelAttribute("item")  Account item, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("message","không được để trống thông tin");
			return "dangky";
		}else{
			ac.save(item);

		}
		return "redirect:/";
	}



	@GetMapping("/cart")
	public String cart(){
		return "home/cart";
	}

	@GetMapping("/confirm")
	public String confirm(){
		return "home/confirm";
	}

	@RequestMapping("/about")
	public String about(Model model) {
		return "home/about";
	}

	@RequestMapping("/lienhe")
	public String lienhe(Model model) {
		return "home/lienhe";
	}

	@GetMapping("/login")
	public String login(){
		return "login";
	}


	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, Model model) {
		// TODO: Check if user/password exists in database


		Optional<Account> acc = ac.findByUsernameAndPassword(username, password);
		if(acc.isPresent()) {
			session.setAttribute("username", username);
			return "redirect:/";
		}
		model.addAttribute("message", "Tên đăng nhập/mật khẩu không đúng");
		return "login";
	}

	@PostMapping("/purchase")
	public String purchase(@RequestParam String address){
		System.out.println("address=" + address);
		System.out.println("items=" + cart.getItems());
		String un = (String) session.getAttribute("username");
		Account acc = ac.findById(un).orElse(null);
		if(acc != null) {
			Order order = new Order();
			order.setAccount(acc);
			order.setAddress(address);
			Order savedOrder = orderRepo.save(order);
			for(OrderDetail item : cart.getItems()){

				item.setOrder(savedOrder);
				orderDetailRepo.save(item);
			}

			cart.clear();

		}
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(){
		session.removeAttribute("username");
		return "redirect:/login";
	}
}
