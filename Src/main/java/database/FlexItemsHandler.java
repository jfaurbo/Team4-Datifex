package database;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class FlexItemsHandler implements FlexItemsDAO {
	
	private final Map<String, SerialItem> serialItems;

	public FlexItemsHandler() {
		serialItems = new HashMap<String, SerialItem>();
	}
	
	@Override
	public List<SerialItem> readFlexItems() {
		return new ArrayList<SerialItem>(serialItems.values());
	}

	@Override
	public SerialItem createFlexItem(SerialItem serialItem) {
		if (serialItem.getId() == null || serialItem.getId().isEmpty()) {
			serialItem.setValue(SerialItem.ID, generateId());
        }
		serialItems.put(serialItem.getId(), serialItem);
        return serialItem;
	} 

	@Override
	public SerialItem readFlexItem(String id) {
		if(id == null || id.isEmpty()) {return null;}
		return serialItems.get(id);
	}

	@Override
	public SerialItem updateFlexItem(String id, SerialItem updatedItem) {
		if(id == null || id.isEmpty()) {return null;}
		serialItems.put(id, updatedItem);
        return serialItems.get(id);
	}

	@Override
	public boolean deleteFlexItem(String id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	private String generateId() {
        return (serialItems.size() + "");
    }

}
