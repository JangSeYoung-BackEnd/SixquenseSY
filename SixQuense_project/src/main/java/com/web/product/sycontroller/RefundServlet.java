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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.web.product.dto.ProductpaymentDto;
import com.web.product.syservice.ProductPackageRefundService;

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
		String totalAmount = request.getParameter("total");
        // API 키와 시크릿 키를 사용하여 액세스 토큰을 요청
        String accessToken = getToken("2016848622817237", "ERk2KLQLdhnDwi9BDSG7ZydoSk4Ny5BpXTPPCKKGxdPTpml7voPb6Fhak5YF017VMnMygAcvqmOt9ZoE");

        URL url = new URL("https://api.iamport.kr/payments/cancel");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

        
        conn.setRequestMethod("POST");

        conn.setRequestProperty("Content-type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Authorization", accessToken);

        
        conn.setDoOutput(true);

        JsonObject json = new JsonObject();
        json.addProperty("imp_uid", imp_uid);
        json.addProperty("amount", totalAmount);
        json.addProperty("reason", "환불 요청");

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString());
        bw.flush();
        bw.close();

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        br.close();
        conn.disconnect();

        System.out.println("[결제 취소 완료] imp_uid : "+ imp_uid);
        
        // 결제 상태 업데이트
        ProductPackageRefundService service=new ProductPackageRefundService();
        boolean updateResult = service.updatePaymentStatus(imp_uid, "환불완료");
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.setAttribute("imp_uid", imp_uid);
        request.setAttribute("total", totalAmount);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/product/paymentrefund.jsp"); 
        dispatcher.forward(request, response);
        out.println("<h1>환불 결과</h1>");
        out.println("<p>imp_uid: " + imp_uid + " 결제가 취소되었습니다.</p>");
    }

    private String getToken(String apiKey, String secretKey) throws IOException {
        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setDoOutput(true);

        JsonObject json = new JsonObject();
        json.addProperty("imp_key", apiKey);
        json.addProperty("imp_secret", secretKey);

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(json.toString());
        bw.flush();
        bw.close();

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
