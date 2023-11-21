package com.web.product.sycontroller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

@WebServlet("/productpackage/refund.do")
public class RefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RefundServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imp_uid = request.getParameter("imp_uid");

        // API 키와 시크릿 키를 사용하여 액세스 토큰을 요청하는 메소드 호출
        String accessToken = getToken("2016848622817237", "ERk2KLQLdhnDwi9BDSG7ZydoSk4Ny5BpXTPPCKKGxdPTpml7voPb6Fhak5YF017VMnMygAcvqmOt9ZoE");

        URL url = new URL("https://api.iamport.kr/payments/cancel");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

        // 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");

        // 요청의 Content-Type, Accept, Authorization 헤더 설정
        conn.setRequestProperty("Content-type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Authorization", accessToken);

        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);

        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("imp_uid", imp_uid);
        json.addProperty("reason", "환불 요청");

        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString());
        bw.flush();
        bw.close();

        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        br.close();
        conn.disconnect();

        System.out.println("[결제 취소 완료] imp_uid : "+ imp_uid);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<h1>환불 결과</h1>");
        out.println("<p>imp_uid: " + imp_uid + " 결제가 취소되었습니다.</p>");
    }

    private String getToken(String apiKey, String secretKey) throws IOException {
        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

        // 요청 방식을 POST로 설정
        conn.setRequestMethod("POST");

        // 요청의 Content-Type과 Accept 헤더 설정
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");

        // 해당 연결을 출력 스트림(요청)으로 사용
        conn.setDoOutput(true);

        // JSON 객체에 해당 API가 필요로하는 데이터 추가.
        JsonObject json = new JsonObject();
        json.addProperty("imp_key", apiKey);
        json.addProperty("imp_secret", secretKey);

        // 출력 스트림으로 해당 conn에 요청
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString());
        bw.flush();
        bw.close();

        // 입력 스트림으로 conn 요청에 대한 응답 반환
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        Gson gson = new Gson();
        TypeToken<Map<String, Object>> typeToken = new TypeToken<Map<String, Object>>() {};
        Map<String, Object> responseMap = gson.fromJson(br.readLine(), typeToken.getType());
        Map<String, Object> response = (Map<String, Object>) responseMap.get("response");
        String accessToken = (String) response.get("access_token");
        br.close();

        conn.disconnect();

        System.out.println("Iamport 엑세스 토큰 발급 성공 : "+ accessToken);
        return accessToken;
    }
}
