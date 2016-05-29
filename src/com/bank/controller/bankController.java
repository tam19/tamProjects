package com.bank.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import org.json.JSONArray;
import org.json.JSONObject;

@Path("/details")
public class bankController {

	@GET
	@Produces("application/json")
	public String sayHtmlHello() {
		JSONObject bankObject = new JSONObject();
		JSONArray bankArray = new JSONArray();
		JSONObject bankObject1 = new JSONObject();
		Map<String, String> bankNameMap = new HashMap<String, String>();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(
					getClass().getClassLoader().getResourceAsStream("com/bank/controller/bank_branches.csv")));
			String line = br.readLine();
			while ((line = br.readLine()) != null && !line.isEmpty()) {
				String[] tokens = line.split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)", -1);
				bankObject.put("ifsc", tokens[0]);
				bankObject.put("bankId", tokens[1]);
				bankObject.put("branch", tokens[2]);
				bankObject.put("address", tokens[3]);
				bankObject.put("city", tokens[4]);
				bankObject.put("dist", tokens[5]);
				bankObject.put("state", tokens[6]);
				bankObject.put("bankName", tokens[7]);
				bankNameMap.put(tokens[1], tokens[7]);
				bankArray.put(bankObject);
				bankObject = new JSONObject();
			}
			br.close();
			bankObject1.put("all", bankArray);
			JSONObject tempObj = new JSONObject(bankNameMap);
			bankObject1.put("unique", tempObj);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bankObject1.toString();
	}

}
