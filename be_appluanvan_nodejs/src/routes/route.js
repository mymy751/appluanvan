const express = require('express');
const router = express.Router();
const { getProduct, getABC, getCustomOrder, getAddProduct, postAddProduct, 
    postDeleteProduct, getUpdateProduct, postUpdateProduct, 
    getAddCategory, getCategory, getUser, getCart,
    postAddCategory, postDeleteCategory, getUpdateCategory, postUpdateCategory,
    getCategoryForProduct, getLogin, postLogin,
    getAllProduct, getAllProductByName, getAllCategory, 
    getProductOutstanding, getAddProductOutstanding, postAddProductOutstanding, postDeleteProductOutstanding, 
    getUpdateProductOutstanding, postUpdateProductOutstanding, getAllProductOutstanding,
    getAllCategoryByName, getAddToCart, postAddToCart} = require('../controllers/adminController');


router.get('/product', getProduct);  

router.get('/abc', getABC);

router.get('/custom-order', getCustomOrder);

router.get('/add-product', getAddProduct);

router.post('/add-product', postAddProduct);

router.post('/delete-product', postDeleteProduct); //các đường dẫn '/delete-product','/add-product'này sẽ kêu là endpoint 

router.get('/update-product', getUpdateProduct);

router.post('/update-product', postUpdateProduct);

router.get('/category', getCategory);

router.get('/add-category', getAddCategory);

router.get('/update-category', getUpdateCategory);

router.post('/update-category', postUpdateCategory);

router.post('/add-category', postAddCategory);

router.post('/delete-category', postDeleteCategory);

router.get('/getCategoryForProduct', getCategoryForProduct);

router.get('/user', getUser);


router.get('/login', getLogin);

router.post('./login', postLogin);

router.get('/api/getAllProduct', getAllProduct);

router.get('/api/getAllProductByName', getAllProductByName);

router.get('/api/getAllCategory', getAllCategory);

router.get('/api/getAllCategoryByName', getAllCategoryByName);

router.get('/product-outstanding', getProductOutstanding);
router.get('/add-product-outstanding', getAddProductOutstanding);
router.post('/add-product-outstanding', postAddProductOutstanding);
router.post('/delete-product-outstanding', postDeleteProductOutstanding);
router.get('/update-product-outstanding', getUpdateProductOutstanding);
router.post('/update-product-outstanding', postUpdateProductOutstanding);

router.get('/api/getAllProductOutstanding', getAllProductOutstanding);

// router.get('/cart', getCart);
// router.get('/api/getAddToCart', getAddToCart);

// router.post('/api/add-to-cart', postAddToCart);



module.exports = router;
