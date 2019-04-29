package com.shs.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shs.dto.MemberDTO;
import com.shs.mybatis.SqlMapConfig;

public class MemberDAO {
//	MyBatis세팅값 호출
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
//	mapper접근 sqlsession
	SqlSession sqlSession;
	
//	singleton패턴을 활용한 DAO객체 사용
//	:객체생성은 1회만 동작,생성된 객체를 빌려쓰는 형태로써 외부에서는 객체생성이 불가능하게 잠근다
	private MemberDAO() {}
	// 외부에서 빌려서 사용할 객체 생성(instance)
	// static일때는 인스턴스가 만들어지지 않으므로, 접근할 때는 클래스명으로 접근해야함.
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	int result = 0;
	
//	회원등록기능
	public int memInsert(MemberDTO mDto) {
//		sql세션을 오픈하겠다.mybatis에서 일할 노동자를 하나 만든 것.
		sqlSession = sqlSessionFactory.openSession(true);
		
//		커밋방법
//		sqlSession.commit();과 같은 방법이 있고, openSession의매개변수 안에 true를넣는 방법도 있다.
		try {
			result = sqlSession.insert("memInsert", mDto);
			if(result > 0) {
				System.out.println("등록 성공");
			} else {
				System.out.println("등록 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
//			자원사용 후 반납
		}
		return result;
	}
	
	
//	출석부(전체회원출력)
	public List<MemberDTO> memSelect() {
		sqlSession = sqlSessionFactory.openSession();
		// select는 화면에 정보만 띄어주는거니까 커밋할필요 없음.
		List<MemberDTO> list = null;
		try {
			list = sqlSession.selectList("memSelect");
			// select가 여러개 있는데,그중에 memSelect라는 것을 실행하겠다.
			// 아래의 for문은 DB에서 값을 제대로 가져왔는지 확인하는 작업이다.
			for (MemberDTO memberDTO : list) {
				System.out.print(memberDTO.getSid()+", ");
				System.out.print(memberDTO.getSname()+", ");
				System.out.println(memberDTO.getSphone()+", ");
				System.out.println();

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSession.close();
		}
		return list;
	}
	
	
//	수정을 위한 회원정보출력(1명의 정보만 띄어줌)
	public MemberDTO memInfo(int id) {
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = null;
		try {
			mDto = sqlSession.selectOne("memInfo",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return mDto;
	}
	
//	실제로 수정 동작을 하는 기능
	public int memUpdate(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.update("memUpdate", mDto);
			if (result > 0) {
				System.out.println("수정성공");
			} else {
				System.out.println("수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
//	회원정보수정기능
	public int memDelete(int id) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			result = sqlSession.delete("memDelete", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
}

