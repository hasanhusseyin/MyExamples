import { combineReducers } from "redux";
import CategoryList from "../../components/categories/CategoryList";
import changeCategoryReducer from "./changeCategoryReducer";
import changeListReducer from "./categoryListReducer";

const rootReducer = combineReducers({
  changeCategoryReducer,
  changeListReducer,
});

export default rootReducer;
