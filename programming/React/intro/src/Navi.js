import React from "react";
import {
  Navbar,
  NavbarBrand,
  Collapse,
  Nav,
  NavLink,
  NavItem,
  NavbarToggler,
  NavbarText,
} from "reactstrap";
import CartSummary from "./CartSummary";

export default class Navi extends React.Component {
  constructor(props) {
    super(props);

    this.toggle = this.toggle.bind(this);
    this.state = {
      isOpen: false,
    };
  }
  toggle() {
    this.setState({ isOpen: !this.state.isOpen });
  }

  render() {
    return (
      <div>
        <Navbar color="light" expand="md" light>
          <NavbarBrand href="/">Northwind App</NavbarBrand>
          <NavbarToggler onClick={function noRefCheck() {}} />
          <Collapse navbar>
            <Nav className="me-auto" navbar>
              <NavItem>
                <NavLink href="/components/">Components</NavLink>
              </NavItem>
              <NavItem>
                <NavLink href="https://github.com/reactstrap/reactstrap">
                  GitHub
                </NavLink>
              </NavItem>
              <CartSummary removeFromCart={this.props.removeFromCart} cart={this.props.cart} />
            </Nav>
            <NavbarText>Simple Text</NavbarText>
          </Collapse>
        </Navbar>
      </div>
    );
  }
}
