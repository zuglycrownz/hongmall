package com.docmall.controller;

import org.springframework.stereotype.Controller;

import com.docmall.service.CartService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CartController {

	
	private final CartService cartService;
}
