package com.home.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.home.springdemo.entity.Customer;
import com.home.springdemo.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	// need to inject customer service
	@Autowired
	private CustomerService customerService;

	@GetMapping("/list")
	public String list(Model model) {

		// get customers from the service
		List<Customer> customers = customerService.getCustomers();

		// add those customers to the model
		model.addAttribute("customers", customers);

		return "list-customers";
	}

	@GetMapping("addCustomer")
	public String addCustomer(Model model) {

		Customer customer = new Customer();
		model.addAttribute(customer);
		return "add-customer";
	}

	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer customer) {
		// Save Customer
		customerService.saveCustomer(customer);
		return "redirect:/customer/list";
	}

	@GetMapping("/showFormUpdate")
	public String update(@RequestParam("customerId") int id, Model model) {
		// Get the customer form the database
		Customer customer = customerService.getCustomer(id);

		// set customer as a model attribute
		model.addAttribute("customer", customer);
		return "add-customer";
	}

	@GetMapping("deleteCustomer")
	public String deleteCustomer(@RequestParam("customerId") int id) {

		Customer customer = customerService.getCustomer(id);

		customerService.deleteCustomer(customer);

		return "redirect:/customer/list";
	}
}
