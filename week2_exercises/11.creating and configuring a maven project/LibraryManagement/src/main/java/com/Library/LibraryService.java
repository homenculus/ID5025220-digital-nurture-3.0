package com.library.service;

import com.library.repository.LibraryRepository;

public class LibraryService {
    private LibraryRepository libraryRepository;

    public void setLibraryRepository(LibraryRepository libraryRepository) {
        this.libraryRepository = libraryRepository;
    }

    public void addBook(String book) {
        libraryRepository.addBook(book);
    }
}
