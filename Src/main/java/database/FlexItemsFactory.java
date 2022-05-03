package database;

public class FlexItemsFactory {
	
	private static FlexItemsDAO flexItemsDAO = new DbDocumentHandler();
	
	public static FlexItemsDAO getDao() {
		return flexItemsDAO;
	}

}
