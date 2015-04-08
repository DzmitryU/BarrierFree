package by.ulezla.utils.Json;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

public abstract class JsonConfig{

    private JsonConfig(){

    }

    private static final ObjectMapper CONFIGURED_OBJECT_MAPPER;

    static {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        objectMapper.configure(SerializationFeature.WRAP_ROOT_VALUE, false);
        objectMapper.configure(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS, true);
        objectMapper.configure(SerializationFeature.WRITE_EMPTY_JSON_ARRAYS, true);

        CONFIGURED_OBJECT_MAPPER = objectMapper;
    }

    public static ObjectMapper getObjectMapperInstance(){
        return CONFIGURED_OBJECT_MAPPER;
    }
}