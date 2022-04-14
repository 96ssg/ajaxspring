package com.yedam.myserver.users.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.myserver.users.mapper.UserMapper;
import com.yedam.myserver.users.vo.UserVO;

@CrossOrigin(origins = {"*"}, maxAge = 3600) // CORS 회피 origins={"*"}
@RestController
public class UserController {

	@Autowired UserMapper mapper;
	
	@GetMapping("/users")
	public List<UserVO> userSelect() {
		return mapper.find();
	}
	
	@GetMapping("/users/{id}")
	public UserVO userSelectList(@PathVariable String id, UserVO vo) {
		vo.setId(id);
		return mapper.findById(vo);
	}
		
	@PostMapping("/users") // > json형식으로 {"id":"??", "pwd":"???",...}
	public UserVO userInsert(@RequestBody UserVO vo) { // @RequestBody >> Json타입으로 보내려면 무조건사용
		
		 mapper.persist(vo);
		 return vo;
	}
	
	@PutMapping("/users") // 파라미터 queryString , jsonstring // put method는 무조건 json으로만 가능
	public UserVO userUpdate(@RequestBody UserVO vo) {
		
		 mapper.merge(vo);
		 return vo;
	}	
	@DeleteMapping("/users/{id}")
	public UserVO userDelete(@PathVariable String id,UserVO vo) {
		vo.setId(id);
		 mapper.remove(vo);
		 return vo;
	}		
}
