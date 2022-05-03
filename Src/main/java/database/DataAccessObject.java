package database;

import com.azure.cosmos.ConsistencyLevel;
import com.azure.cosmos.CosmosClient;
import com.azure.cosmos.CosmosClientBuilder;

public class DataAccessObject {

	private static final String HOST = "https://team4master.documents.azure.com:443/";
	private static final String MASTER_KEY = "ciSRUvvut1ykQFUJNVVeHtc0AGeGPXgaBIlr26reoTsHWhUaL8v57c9G8ZSZg0qTf8UQJxK1RcDQvpKRvc8xxw==";
	
	private static CosmosClient cosmosClient = new CosmosClientBuilder()
            .endpoint(HOST)
            .key(MASTER_KEY)
            .consistencyLevel(ConsistencyLevel.EVENTUAL)
            .buildClient();

    public static CosmosClient getCosmosClient() {
        return cosmosClient;
    }
}
