package services

import (
	itemDao "items-api/daos/item"
	"items-api/dtos"
	model "items-api/models"
	e "items-api/utils/errors"
)

type itemService struct{}

type itemServiceInterface interface {
	//GetBook(id string) (dtos.ItemDto, e.ApiError)
	//InsertBook(itemDto dtos.ItemDto) (dtos.ItemDto, e.ApiError)
	Insert(itemsDto dtos.ItemsDto) (dtos.ItemsDto, e.ApiError)
}

var (
	ItemService itemServiceInterface
)

func init() {
	ItemService = &itemService{}
}

func (s *itemService) Insert(itemsDto dtos.ItemsDto) (dtos.ItemsDto, e.ApiError) {

	var items model.Items
	var item model.Item

	for _, itemDto := range itemsDto {

		item.City = itemDto.City
		item.Currency = itemDto.Currency
		item.Description = itemDto.Description
		item.Number = itemDto.Number
		item.Pictures = itemDto.Pictures
		item.Price = itemDto.Price
		item.Seller = itemDto.Seller
		item.State = itemDto.State
		item.Street = itemDto.Street
		item.Tittle = itemDto.Tittle

		items = append(items, item)
	}

	items = itemDao.Insert(items) // al dao

	var i int = 0
	for _, item := range items {
		itemsDto[i].Id = item.Id.Hex()
	}

	return itemsDto, nil
}

/*func (s *bookService) GetBook(id string) (dtos.BookDto, e.ApiError) {

	var book model.Book = bookDao.GetById(id)
	var bookDto dtos.BookDto

	if book.Id.Hex() == "000000000000000000000000" {
		return bookDto, e.NewBadRequestApiError("book not found")
	}
	bookDto.Name = book.Name
	bookDto.Id = book.Id.Hex()
	return bookDto, nil
}



func (s *bookService) InsertBook(bookDto dtos.BookDto) (dtos.BookDto, e.ApiError) {

	var book model.Book

	book.Name = bookDto.Name

	book = bookDao.Insert(book)

	if book.Id.Hex() == "000000000000000000000000" {
		return bookDto, e.NewBadRequestApiError("error in insert")
	}
	bookDto.Id = book.Id.Hex()

	return bookDto, nil
}*/
