import React, { Component } from 'react'
import { Col, Row } from 'reactstrap'
import CategoryList from '../categories/CategoryList'
import ProductsList from '../products/ProductsList'

export default class Dashboard extends Component {
  render() {
    return (
      <div>
          <Row>
              <Col xs="3">
                  <CategoryList></CategoryList>
              </Col>
              <Col xs="9">
                  <ProductsList></ProductsList>
              </Col>
          </Row>
      </div>
    )
  }
}
