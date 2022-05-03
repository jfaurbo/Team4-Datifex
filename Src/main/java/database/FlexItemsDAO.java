package database;

import java.util.List;

public interface FlexItemsDAO {
	
	public List<SerialItem> readFlexItems();
	
	public SerialItem createFlexItem(SerialItem serialItem);
	
	public SerialItem readFlexItem(String id);
	
	public SerialItem updateFlexItem(String id, SerialItem serialItem);
	
	public boolean deleteFlexItem(String id);

}
