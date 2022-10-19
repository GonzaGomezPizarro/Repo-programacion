package dtos

type ItemDto struct {
	Id          string   `json:"id"`
	Tittle      string   `json:"tittle"`
	Seller      string   `json:"seller"`
	Price       float64  `json:"price"`
	Currency    string   `json:"currency"`
	Pictures    []string `json:"pictures"`
	Description string   `json:"description"`
	State       string   `json:"state"`
	City        string   `json:"city"`
	Street      string   `json:"street"`
	Number      int      `json:"number"`
}

type ItemsDto []ItemDto
