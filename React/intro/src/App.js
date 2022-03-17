import React from "react";
import CategoryList from "./CategoryList";
import Navi from "./Navi";
import ProductList from "./ProductList";
import { Container, Row, Col } from "reactstrap";
import { Component } from "react";
import alertify from "alertifyjs";
import { BrowserRouter, Route, Router, Routes } from "react-router-dom";
import NotFound from "./NotFound";
import CartList from "./CartList";
export default class App extends Component {
  state = {
    currentCategory: "",
    products: [],
    cart: [],
  };

  componentDidMount() {
    this.getProducts();
  }
  changeCategory = (category) => {
    this.setState({ currentCategory: category.categoryName });
    this.getProducts(category.id);
  };

  getProducts = (categoryId) => {
    let url = "http://localhost:3000/products";
    if (categoryId) {
      url = url + "?categoryId=" + categoryId;
    }

    fetch(url)
      .then((response) => response.json())
      .then((data) => this.setState({ products: data }));
  };
  addToCart = (product) => {
    let newCart = this.state.cart;
    var addedItem = newCart.find((c) => c.product.id === product.id);
    if (addedItem) {
      addedItem.quantity += 1;
    } else {
      newCart.push({ product: product, quantity: 1 });
    }

    this.setState({ cart: newCart });
    alertify.success(product.productName + "added to cart...", 1);
  };

  removeFromCart = (product) => {
    let newCart = this.state.cart.filter((c) => c.product.id !== product.id);
    this.setState({ cart: newCart });
  };
  render() {
    let productInfo = { title: "ProductList" };
    let categoryInfo = { title: "CategoryList" };
    return (
      <div className="App">
        <Container>
          <Navi cart={this.state.cart} removeFromCart={this.removeFromCart} />
          <Row>
            <Col xs="3">
              <CategoryList
                currentCategory={this.state.currentCategory}
                changeCategory={this.changeCategory}
                info={categoryInfo}
              />
            </Col>
            <Col xs="9">
              <BrowserRouter>
                <Routes>
                  <Route  path="/" component={<NotFound/>} />
                  <Route  path="/cart" component={<CartList/>} />
                  <Route
                    
                    path="/"
                    render={(props) => (
                      <ProductList
                        {...props}
                        product={this.state.products}
                        addToCart={this.addToCart}
                        currentCategory={this.state.currentCategory}
                        info={this.productInfo}
                      />
                    )}
                  ></Route>
                </Routes>
              </BrowserRouter>
            </Col>
          </Row>
        </Container>
      </div>
    );
  }
}
