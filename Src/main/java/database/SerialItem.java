package database;

import java.util.HashMap;

//@Data
//@Builder
public class SerialItem {
	public static final String ID = "id";
	public static final String ENTITY_TYPE = "entityType";
	public static final String SERIAL_NUMBER = "serial_number";
	public static final String SERIAL_TITLE = "serial_title";
	public static final String SERIAL_COLOR = "serial_color";
	public static final String SERIAL_DATE_START_LOCAL = "serial_date_start_local";
	public static final String SERIAL_DATE_END_LOCAL = "serial_date_end_local";
	public static final String SERIAL_DATE_START_ZULU = "serial_date_start_zulu";
	public static final String SERIAL_DATE_END_ZULU = "serial_date_end_zulu";
	public static final String SERIAL_TIME_START_LOCAL = "serial_time_start_local";
	public static final String SERIAL_TIME_END_LOCAL = "serial_time_end_local";
	public static final String SERIAL_TIME_START_ZULU = "serial_time_start_zulu";
	public static final String SERIAL_TIME_END_ZULU = "serial_time_start_zulu";
	public static final String SERIAL_OPI = "serial_opi";
	public static final String SERIAL_PARTICIPANTS = "serial_participants";
	public static final String SERIAL_LOCATION = "serial_location";
	public static final String SERIAL_INFO = "serial_info";
	public static final String SERIAL_TYPE = "serial_type";
	public static final String SERIAL_STATUS = "serial_status";
	public static final String SERIAL_CREATED_BY = "serial_created_by";
	public static final String SERIAL_MODIFIED_BY = "serial_modified_by";
	public static final String SERIAL_MODIFIED_TIMESTAMP = "serial_modified_timestamp";
		
	public static String STATUS_DRAFT = "status_draft";
	public static String STATUS_APPROVED = "status_approved";
	public static String STATUS_CANCELLED = "status_cancelled";
	
	public static String ENTITY_TYPE_SERIAL = "serialItem";
	
	public static String[] all_keys = {ID, SERIAL_NUMBER, SERIAL_TITLE, SERIAL_TIME_START_LOCAL, SERIAL_TIME_END_LOCAL,
			SERIAL_TIME_START_ZULU, SERIAL_TIME_END_ZULU, SERIAL_OPI, SERIAL_PARTICIPANTS, SERIAL_LOCATION,
			SERIAL_INFO, SERIAL_STATUS, SERIAL_DATE_START_LOCAL, SERIAL_DATE_END_LOCAL, 
			SERIAL_DATE_START_ZULU, SERIAL_DATE_END_ZULU, SERIAL_TYPE,
			SERIAL_CREATED_BY, SERIAL_MODIFIED_BY, SERIAL_MODIFIED_TIMESTAMP};
	
	public static String[] keys = {SERIAL_NUMBER, SERIAL_TITLE, SERIAL_TIME_START_LOCAL, SERIAL_TIME_END_LOCAL,
			SERIAL_TIME_START_ZULU, SERIAL_TIME_END_ZULU, SERIAL_OPI, SERIAL_PARTICIPANTS, SERIAL_LOCATION,
			SERIAL_INFO, SERIAL_STATUS, SERIAL_DATE_START_LOCAL, SERIAL_DATE_END_LOCAL, 
			SERIAL_DATE_START_ZULU, SERIAL_DATE_END_ZULU, SERIAL_TYPE};
	
	private HashMap<String, String> properties;
	
	public SerialItem(String id) {
		properties = new HashMap<>();
		setValue(ID, id);
	}
	
	public SerialItem(String id, HashMap<String, String> properties) {
		this.properties = properties;
		setValue(ID, id);
	}
	
	
	public String getValue(String key) {
		if(key == null || key.isEmpty()) {return null;}
		return properties.get(key);
	}
	
	public void setValue(String key, String value) {
		if(key == null || key.isEmpty()) {return;}
		properties.put(key, value);
	}
	
	public String getId() {
		return getValue(ID);
	}


}
