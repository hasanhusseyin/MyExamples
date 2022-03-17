import React, { Component } from "react";
import { Button, Table } from "reactstrap";

export default class ProductList extends Component {

  state = { product: [] };
  render() {
    return (
      <div>
        <h3>{this.props.info.title}</h3>
        <Table>
          <thead>
            <tr>
              <th>id</th>
              <th>categoryId</th>
              <th>productName</th>
              <th>quantityPerUnit</th>
              <th>Add to Cart</th>
            </tr>
          </thead>
          <tbody>
            {this.props.products.map((product) => (
              <tr key={product.id}>
                <th scope="row">{product.id}</th>
                <td>{product.categoryId}</td>
                <td>{product.productName}</td>
                <td>{product.quantityPerUnit}</td>
                <td><Button onClick={()=>this.props.addToCart(product)} color="info">Add to Cart</Button></td>
              </tr>
            ))}
          </tbody>
        </Table>
      </div>
    );
  }
}
