/*
 * package com.web.product.sycontroller;
 * 
 * import java.net.http.HttpClient; import java.net.http.HttpResponse;
 * 
 * import javax.servlet.annotation.WebServlet; import
 * javax.servlet.http.HttpServlet;
 * 
 * import org.json.simple.JSONObject; import org.apache.http.client.HttpClient;
 * import org.apache.http.client.methods.HttpPost; import
 * org.apache.http.entity.StringEntity; import
 * org.apache.http.impl.client.HttpClients; import
 * org.apache.http.util.EntityUtils; import org.json.JSONObject;
 * 
 * @WebServlet("/ProductPackageOrderRefundServlet") public class
 * ProductPackageOrderRefundServlet extends HttpServlet { private static final
 * long serialVersionUID = 1L;
 * 
 * public ProductPackageOrderRefundServlet() { super(); }
 * 
 * // 아임포트에서 토큰을 가져오는 메소드 private String getImportToken() { String result = "";
 * HttpClient client = HttpClients.createDefault(); HttpPost post = new
 * HttpPost(IMPORT_TOKEN_URL);
 * 
 * JSONObject json = new JSONObject(); json.put("imp_key", KEY);
 * json.put("imp_secret", SECRET); try { StringEntity entity = new
 * StringEntity(json.toString()); post.setEntity(entity);
 * post.setHeader("Accept", "application/json"); post.setHeader("Content-type",
 * "application/json");
 * 
 * HttpResponse response = client.execute(post); result =
 * EntityUtils.toString(response.getEntity(), "UTF-8"); } catch (Exception e) {
 * e.printStackTrace(); } return result; }
 * 
 * // 아임포트에서 결제 정보를 가져오는 메소드 private Order_Info getPayInfo(String token, String
 * mId) { Order_Info orderInfo = new Order_Info(); // 아임포트 API를 이용해 결제 정보를 가져오는
 * 로직을 구현하세요. return orderInfo; }
 * 
 * // 아임포트에서 환불을 처리하는 메소드 private int cancelPay(String token, String mid) { int
 * result = 0; HttpClient client = HttpClients.createDefault(); HttpPost post =
 * new HttpPost(IMPORT_CANCEL_URL);
 * 
 * JSONObject json = new JSONObject(); json.put("merchant_uid", mid); try {
 * StringEntity entity = new StringEntity(json.toString());
 * post.setEntity(entity); post.setHeader("Authorization", token);
 * post.setHeader("Accept", "application/json"); post.setHeader("Content-type",
 * "application/json");
 * 
 * HttpResponse response = client.execute(post); String entity =
 * EntityUtils.toString(response.getEntity(), "UTF-8"); JSONObject jsonObject =
 * new JSONObject(entity); String responseResult =
 * jsonObject.get("response").toString();
 * 
 * if (responseResult.equals("null")) { System.err.println("환불실패"); result = -1;
 * } else { System.err.println("환불성공"); result = 1; } } catch (Exception e) {
 * e.printStackTrace(); } return result; }
 */