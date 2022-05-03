package database;


import java.io.IOException;
import java.util.HashMap;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/api")
public class ApiServlet extends HttpServlet  {
	// API Keys
    public static final String API_METHOD = "method";

    // API Methods
    public static final String CREATE_FLEX_ITEM = "createFlexItem";
    public static final String GET_FLEX_ITEMS = "getFlexItems";
    public static final String UPDATE_FLEX_ITEM = "updateFlexItem";

    // API Parameters
    //located in the serial item class

    public static final String MESSAGE_ERROR_INVALID_METHOD = "{'error': 'Invalid method'}";

    private static final long serialVersionUID = 1L;
    private static final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

    	System.out.println("Flex App: received HttpServletRequest");
    	
        String apiResponse = MESSAGE_ERROR_INVALID_METHOD;

        SerialItemController flexItemController = SerialItemController
                .getInstance();

        //extract parameters
        String id = request.getParameter(SerialItem.ID);

  

        switch (request.getParameter(API_METHOD)) {
        case CREATE_FLEX_ITEM:
        	System.out.println("Flex App: received " + CREATE_FLEX_ITEM + " request");
        	
        	HashMap<String, String> new_item_properties = extractParameters(request);
        	apiResponse = gson.toJson(flexItemController.createFlexItem(new_item_properties));
            break;
        case GET_FLEX_ITEMS:
        	System.out.println("Flex App: received " + CREATE_FLEX_ITEM + " request");
        	
        	apiResponse = gson.toJson(flexItemController.getFlexItems());
            break;
        case UPDATE_FLEX_ITEM:
        	System.out.println("Flex App: received " + CREATE_FLEX_ITEM + " request");
        	
        	HashMap<String, String> updated_item_properties = extractParameters(request);
        	SerialItem updatedItem = new SerialItem(id, updated_item_properties);
        	apiResponse = gson.toJson(flexItemController.updateFlexItem(id,
        			updatedItem));
            break;
        default:
            break;
        }

        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(apiResponse);
    }
    
    private HashMap<String, String> extractParameters(HttpServletRequest request){
    	HashMap<String, String> properties = new HashMap<>();
    	
    	for(String k:SerialItem.keys) {
    		String val = request.getParameter(k);
    		if(val != null) {
    			properties.put(k, request.getParameter(k));
    		}
    	}

        return properties;
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
