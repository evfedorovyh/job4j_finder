package ru.job4j.io;

import java.util.HashMap;
import java.util.Map;

public class ArgsName {

    private final Map<String, String> values = new HashMap<>();

    public String get(String key) throws IllegalArgumentException {
        if (!values.containsKey(key)) {
            throw new IllegalArgumentException(String.format("This key: '%s' is missing", key));
        }
        return values.get(key);
    }

    private void parse(String[] args) throws IllegalArgumentException {
        String[] arguments;
        int indexOfEqual;
        for (String line : args) {
            if (!line.startsWith("-")) {
                throw new IllegalArgumentException(String.format("Error: This argument '%s' does not start with a '-' character", line));
            }
            indexOfEqual = line.indexOf("=");
            if (indexOfEqual == 1) {
                throw new IllegalArgumentException(String.format("Error: This argument '%s' does not contain a key", line));
            }
            if (indexOfEqual == line.length() - 1) {
                throw new IllegalArgumentException(String.format("Error: This argument '%s' does not contain a value", line));
            }
            if (indexOfEqual == -1) {
                throw new IllegalArgumentException(String.format("Error: This argument '%s' does not contain an equal sign", line));
            }
            arguments = line.substring(1).split("=", 2);
            values.put(arguments[0], arguments[1]);
        }
    }

    public static ArgsName of(String[] args) {
        if (args.length == 0) {
            throw new IllegalArgumentException("Arguments not passed to program");
        }
        ArgsName names = new ArgsName();
        names.parse(args);
        return names;
    }
}
