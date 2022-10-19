package item

import (
	"context"
	"fmt"
	model "items-api/models"
	"items-api/utils/db"

	//"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

func InsertItem(item model.Item) model.Item {
	db := db.MongoDb

	item.Id = primitive.NewObjectID()
	_, err := db.Collection("items").InsertOne(context.TODO(), &item)

	if err != nil {
		fmt.Println(err)
		return item
	}

	return item
}

func Insert(items model.Items) model.Items {

	for _, item := range items {
		item = InsertItem(item)
	}

	return items
}

/*func GetById(id string) model.Book {
	var book model.Book
	db:=db.MongoDb
objID, err := primitive.ObjectIDFromHex(id)
if err != nil {
  fmt.Println(err)
  return book
}
  err = db.Collection("books").FindOne(context.TODO(), bson.D{{"_id", objID}}).Decode(&book)
if err != nil {
  fmt.Println(err)
  return book
}
	return book

}

func Insert(book model.Book) model.Book {
	db:=db.MongoDb
	insertBook:=book
	insertBook.Id=primitive.NewObjectID()
	_, err := db.Collection("books").InsertOne(context.TODO(), &insertBook)

if err != nil {
	fmt.Println(err)
	return book
}
	 book.Id =  insertBook.Id
	return book
}*/
