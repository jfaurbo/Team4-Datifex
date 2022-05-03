package database;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

public class SerialItemController {
	
	public static SerialItemController getInstance() {
        if (serialItemController == null) {
        	serialItemController = new SerialItemController(FlexItemsFactory.getDao());
        }
        return serialItemController;
    }
	
	private static SerialItemController serialItemController;

    private final FlexItemsDAO flexItemsDAO;
    

    SerialItemController(FlexItemsDAO flexItemsDAO) {
        this.flexItemsDAO = flexItemsDAO;
    }

    public SerialItem createFlexItem(HashMap<String, String> serialItemProperties) {
    	String id = UUID.randomUUID().toString();
    	SerialItem serialItem = new SerialItem(id, serialItemProperties);
        return flexItemsDAO.createFlexItem(serialItem);
    }

    public boolean deleteFlexItem(String id) {
        return flexItemsDAO.deleteFlexItem(id);
    }

    public SerialItem getFlexItemById(String id) {
        return flexItemsDAO.readFlexItem(id);
    }

    public List<SerialItem> getFlexItems() {
        return flexItemsDAO.readFlexItems();
    }

    public SerialItem updateFlexItem(String id, SerialItem serialItem) {
        return flexItemsDAO.updateFlexItem(id, serialItem);
    }

}
