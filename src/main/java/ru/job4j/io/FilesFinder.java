package ru.job4j.io;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

public class FilesFinder {
    private static Path pathRoot;
    private static String fileName;
    private static String typeFinder;
    private static String pathOut;
    private final static List<String> TYPES = List.of("mask", "name", "regex");

    public static void main(String[] args) {
        validate(args);
        try (PrintWriter output = new PrintWriter(pathOut)) {
            search(pathRoot, typeFinder).forEach(output::println);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Path> search(Path root, String typeFinder) throws IOException {
        SearchFiles searcher = switch (typeFinder) {
            case "mask" -> new SearchFiles(path -> path.toFile().getName().contains(fileName));
            case "name" -> new SearchFiles(path -> path.toFile().getName().equals(fileName));
            case "regex" -> new SearchFiles(path -> path.toFile().getName().matches(fileName));
            default -> throw new IllegalArgumentException("Type of finder is wrong. Type of finder can be only \"mask\", \"name\", \"regex\".");
        };
        Files.walkFileTree(root, searcher);
        return searcher.getPaths();
    }

    private static void validate(String[] args) {
        ArgsName argsName = ArgsName.of(args);
        if (!Files.isDirectory(Path.of(argsName.get("d")))) {
            throw new IllegalArgumentException(String.format("Root folder \"%s\" is wrong. Check ROOT_FOLDER.", argsName.get("d")));
        }
        if (!TYPES.contains(argsName.get("t"))) {
            throw new IllegalArgumentException("Type of finder is wrong. Type of finder can be only \"mask\", \"name\", \"regex\".");
        }
        if (!argsName.get("o").matches(".*\\w+\\.\\w+")) {
            throw new IllegalArgumentException(String.format("File name \"%s\" is wrong", argsName.get("o")));
        }
        pathRoot = Path.of(argsName.get("d"));
        fileName = argsName.get("n");
        typeFinder = argsName.get("t");
        pathOut = argsName.get("o");
    }
}
