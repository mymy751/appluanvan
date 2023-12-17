
const { request } = require('express');
const {connection} = require('../utils/connection.js');
const {product} = require('../database/database.js');
// const connection = require('../../index.js');

const getProduct = (req, res) => {
    connection.query(`select * from products`, (err, results) => { //Này là câu truy vấn query 
        // console.log(results); //trước khi render thì phải gọi câu truy vấn dữ liệu
        res.render("./product.ejs", {data: results});
    });
    //phải chỉ định đường dẫn trong thư mục view thì nó mới đọc đc file trog ejs
}

const getABC = (req, res) => {
    res.send("mymymym");
};

const getCustomOrder = (req, res) => {
    res.render("./customOrder.ejs");
}

const getAddProduct = (req, res) => {
    res.render("./addProduct.ejs");
};

const getUpdateProduct = (req, res) => {
    const productId = req.query.productId;
    const productName = req.query.productName;
    const productImage = req.query.productImage;
    const productPrice = req.query.productPrice;
    const productStatus = req.query.productStatus;
    const productDiameter = req.query.productDiameter;
    const productHeight = req.query.productHeight;
    const productDescription = req.query.productDescription;
    const productCategory = req.query.productCategory;

    // print("proooooosss ", productDiameter),
    // print("proooooosss ", productHeight),
    // print("proooooosss ", productDescription),
    // print("proooooosss ", productCategory),
    console.log('proooooosss,', productPrice);

    console.log('proooooosss,', productDiameter);

    res.render("./updateProduct.ejs", { 
        productId: productId,
        productName: productName,
        productImage: productImage,
        productPrice: productPrice,
        productStatus: productStatus,
        productDiameter: productDiameter,
        productHeight: productHeight,
        productDescription: productDescription,
        productCategory: productCategory
    });
};

const getProductOutstanding = (req, res) => {
   connection.query(`select * from productoutstanding`, (err, results) => {
    res.render("./productOutstanding.ejs", {data: results});
   })
}
const getAddProductOutstanding = (req, res) => {
    res.render("./addProductOustanding.ejs");
};

const postAddProductOutstanding = (req, res) => {
    const { productName, productPrice, productImage, statusProduct, productDiameter, productHeight, productDescription, productCategory} = req.body; //destructering Object

    console.log('categoryId', productCategory); 

    // Thực hiện thêm sản phẩm vào cơ sở dữ liệu ở đây
    const query = `
        INSERT INTO productoutstanding (product_name, product_price, product_image, 
            status_product, product_diameter, product_height, product_description, product_category)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `;
   
    connection.query(query, [productName, productPrice, productImage, statusProduct, productDiameter, productHeight, productDescription, productCategory], (err, results) => {
        if (err) {
            console.error('Lỗi thêm sản phẩm noi bat: ', err);
            return;
        }
    
    res.send(`<script>alert('Đã thêm Sản phẩm noi bat ${productName} thành công'); window.location.href = '/product-outstanding';</script>`);
    });
}

const postDeleteProductOutstanding = (req, res) => {
    const {productId} = req.body;

    // console.log("Req.body: ", JSON.parse(req.body));

    if (!productId) {
        res.json({ success: false, message: 'Thiếu thông tin productId.' });
        return;
    }

    // Thực hiện xóa sản phẩm trong cơ sở dữ liệu
    const query = `
        DELETE FROM productoutstanding
        WHERE id_product = ?
    `;

    // console.log("Query xóa: ",query);
    connection.query(query, [productId], (err, results) => {
        if (err) {
            console.error('Lỗi xóa sản phẩm noi bat: ', err);
            res.json({ success: false, message: 'Có lỗi xảy ra khi xóa sản phẩm noi bat.' });
            return;
        }

        res.json({ message: `Đã Xóa Sản phẩm noi bat ${productId} thành công` });
    });
};

const getCategory = (req, res) => {
    connection.query(`select * from category`, (err, results) => {
        res.render("./category.ejs", {data: results});
    })
};

const getCategoryForProduct = (req, res) => {
    const query = `
        SELECT * from category
    `;
    connection.query(query, (err, results) => {
        if (err) {
            console.error('Lỗi truy vấn cơ sở dữ liệu', err);
            return;
        }
        const category = results;
        res.json(category);

        console.log('category la:', category);

    });
};

const getAddCategory = (req, res) => {
    res.render('./addCategory.ejs');
};

const getUpdateCategory = (req, res) =>{
    const categoryId = req.query.categoryId;
    const categoryName = req.query.categoryName;


    res.render('./updateCategory.ejs', {
        categoryId: categoryId,
        categoryName: categoryName
    });
};

const getUser = (req, res) => {
    res.render('./user.ejs');
}

const getCart = (req, res) => {
    connection.query(`select * from cart`, (err, results) => {
        res.render("./cart.ejs", {data: results});
    })
};
//Thêm Sản Phẩm
const postAddProduct = (req, res) => {

    const { productName, productPrice, productImage, statusProduct, productDiameter, productHeight, productDescription, productCategory} = req.body; //destructering Object

    console.log('categoryId', productCategory); 

    // Thực hiện thêm sản phẩm vào cơ sở dữ liệu ở đây
    const query = `
        INSERT INTO products (product_name, product_price, product_image, 
            status_product, product_diameter, product_height, product_description, product_category)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `;
   
    connection.query(query, [productName, productPrice, productImage, statusProduct, productDiameter, productHeight, productDescription, productCategory], (err, results) => {
        if (err) {
            console.error('Lỗi thêm sản phẩm: ', err);
            return;
        }
    
    res.send(`<script>alert('Đã thêm Sản phẩm ${productName} thành công'); window.location.href = '/product';</script>`);
});
}

//Xóa sản phẩm 
const postDeleteProduct = (req, res) => {
    const {productId} = req.body;

    // console.log("Req.body: ", JSON.parse(req.body));

    if (!productId) {
        res.json({ success: false, message: 'Thiếu thông tin productId.' });
        return;
    }

    // Thực hiện xóa sản phẩm trong cơ sở dữ liệu
    const query = `
        DELETE FROM products
        WHERE id_product = ?
    `;

    // console.log("Query xóa: ",query);
    connection.query(query, [productId], (err, results) => {
        if (err) {
            console.error('Lỗi xóa sản phẩm: ', err);
            res.json({ success: false, message: 'Có lỗi xảy ra khi xóa sản phẩm.' });
            return;
        }

        res.json({ message: `Đã Xóa Sản phẩm ${productId} thành công` });
    });
};
const getUpdateProductOutstanding = (req, res) => {
    const productId = req.query.productId;
    const productName = req.query.productName;
    const productImage = req.query.productImage;
    const productPrice = req.query.productPrice;
    const productStatus = req.query.productStatus;
    const productDiameter = req.query.productDiameter;
    const productHeight = req.query.productHeight;
    const productDescription = req.query.productDescription;
    const productCategory = req.query.productCategory;

    res.render("./updateProductOutstanding.ejs", { 
        productId: productId,
        productName: productName,
        productImage: productImage,
        productPrice: productPrice,
        productStatus: productStatus,
        productDiameter: productDiameter,
        productHeight: productHeight,
        productDescription: productDescription,
        productCategory: productCategory
    });
};

const postUpdateProductOutstanding = (req, res) =>{
    const { productName, productImage, productPrice, statusProduct, productDiameter, productHeight, productDescription, productCategory, productId} = req.body;

    //Thực hiện cập nhật sản phẩm trong cơ sở dữ liệu
    // console.log('productCategoryyyyy', productCategory);
    
    const query = `
            UPDATE productoutstanding
            SET product_name = ?, product_image = ?, product_price = ?, status_product = ?, product_diameter = ?, product_height = ?, product_description = ?, product_category = ?
            WHERE id_product = ?
    `;

    connection.query(query, [productName, productImage, productPrice, statusProduct, productDiameter, productHeight, productDescription, productCategory, productId ], (err, results) => {
        if (err) {
            console.error('Lỗi cập nhật sản phẩm noi bat: ', err);
            res.json({ success: false, message: 'Có lỗi xảy ra khi cập nhật sản phẩm.' });
            return;
        };
        res.send(`<script>alert('Đã cập nhật Sản phẩm noi bat ${productId} thành công'); window.location.href = '/product-outstanding';</script>`);
    });
};

//Cập nhật sản phẩm
const postUpdateProduct = (req, res) =>{
    const { productName, productImage, productPrice, statusProduct, productDiameter, productHeight, productDescription, productCategory, productId} = req.body;

    //Thực hiện cập nhật sản phẩm trong cơ sở dữ liệu
    // console.log('productCategoryyyyy', productCategory);
    
    const query = `
            UPDATE products
            SET product_name = ?, product_image = ?, product_price = ?, status_product = ?, product_diameter = ?, product_height = ?, product_description = ?, product_category = ?
            WHERE id_product = ?
    `;

    connection.query(query, [productName, productImage, productPrice, statusProduct, productDiameter, productHeight, productDescription, productCategory, productId ], (err, results) => {
        if (err) {
            console.error('Lỗi cập nhật sản phẩm: ', err);
            res.json({ success: false, message: 'Có lỗi xảy ra khi cập nhật sản phẩm.' });
            return;
        };
        res.send(`<script>alert('Đã cập nhật Sản phẩm ${productId} thành công'); window.location.href = '/product';</script>`);
    });
};

const postAddCategory = (req, res) => {
    const {categoryName} = req.body;

    const query = `
        INSERT INTO category (category_name)
        Value (?)
    `;
    connection.query(query, [categoryName], (err, result) =>{
        if(err){
            console.error('Lỗi thêm loại sản phẩm' + err);
            return;
        }
        res.send(`<script>alert('Đã thêm loại sản phẩm ${categoryName} thành công'); window.location.href = '/category';</script>`);
    });
}
const postDeleteCategory = (req, res) =>{
    const {categoryId} = req.body;

    if(!categoryId){
        res.json({ success: false, message: "Thiếu thông tin CategoryId"});
        return;
    }

    const query = `
        DELETE FROM category 
        WHERE id_category = ?
    `;

    connection.query(query, [categoryId], (err, result) =>{
        if(err){
            console.log("Lỗi xóa loại sản phẩm", err);
            res.json({ success: false, message: 'Có Lỗi xảy ra khi xóa loại sản phẩm' });
            return;
        }
        res.json({message: `Đã xóa loại sản phẩm ${categoryId} thành công`});
    })

}

const postUpdateCategory = (req, res) => {
    const {categoryName, categoryId} = req.body;

    console.log("Id cate:"+ categoryId);

    const query = `
        UPDATE category 
        SET category_name = ?
        WHERE id_category = ?
    `;
    console.log("Querylf", query);

    connection.query(query, [categoryName, categoryId], (err, results) => {
        if(err){
            console.error("Lỗi cập nhật loại sản phẩm", err);
            res.json({success: false, message: "Có lỗi xảy ra khi cập nhật loại sản phẩm"});
            return;
        }
        res.send(`<script>alert('Đã cập nhật loại sản phẩm ${categoryName} thành công'); window.location.href='/category'; </script>`)
    })
}


const getLogin = (req, res) =>{
    res.render('./login.ejs')
}
const postLogin = (req, res) =>{
    
}


const getAllProduct = (req, res) => {
    connection.query(`select * from products`, (err, results) => { //Này là câu truy vấn query 
        // console.log(results); //trước khi render thì phải gọi câu truy vấn dữ liệu
       // res.render("./product.ejs", {data: results});
       res.setHeader('Content-Type', 'application/json');
       res.end(JSON.stringify(results));
    });
}

const getAllProductOutstanding = (req, res) => {
    connection.query(`select * from productoutstanding`, (err, results) => { //Này là câu truy vấn query 
        // console.log(results); //trước khi render thì phải gọi câu truy vấn dữ liệu
       // res.render("./product.ejs", {data: results});
       res.setHeader('Content-Type', 'application/json');
       res.end(JSON.stringify(results));
    });
}

const getAllProductByName =(req, res) => {
    let sql = `select * from products where product_name like ?`;

    connection.query(sql, [`%${req.query.queryName}%`], (err, results) => {
        console.log(req.query.queryName);
        res.setHeader('Content-Type', 'application/json');
        console.log(results);
        res.end(JSON.stringify(results));

    });
}

const getAllCategory = (req, res) => {
    connection.query(`select * from category`, (err, results) => {
        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify(results));

        console.log(results);
    });

   
}

const getAllCategoryByName = (req, res) => {
    let sql = `select * from products where product_category = ?`;
    console.log("sql: ", sql);
    connection.query(sql, [`${req.query.queryName}`], (err, results) => {
        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify(results));
        console.log("resdsv", results);
    })
};


const getAddToCart = async (req, res) => {
    connection.query(`select * from cart`, (err, results) => {
        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify(results));
        console.log(results);
    });
}

const postAddToCart = (req, res) => {

    console.log(req.body);

    const {id_cart, totalAmount, quality, productId, productName, productImage, productPrice} = req.body; //destructering Object

    // Thực hiện thêm sản phẩm vào cơ sở dữ liệu ở đây
    const query = `
        INSERT INTO cart (id_cart, total_amount, quality,  
            id_product, product_name, product_image, product_price)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    `;
    
    connection.query(query, [id_cart, totalAmount, quality, productId, productName, productImage, productPrice], (err, results) => {
        if (err) {
            console.error('Lỗi thêm vao cart: ', err);
            return;
        }
    
    // res.send(`<script>alert('Đã thêm Sản phẩm ${productName} thành công'); window.location.href = '/cart';</script>`);
    });
}

module.exports = {
    getProduct,
    getABC,
    getCustomOrder,
    getAddProduct,
    postAddProduct,
    postDeleteProduct,
    getUpdateProduct,
    postUpdateProduct,
    getAddCategory,
    getCategory,
    getUser,
    getCart,
    postAddCategory,
    postDeleteCategory,
    getUpdateCategory,
    postUpdateCategory,
    getCategoryForProduct,
    getLogin,
    postLogin,
    getAllProduct,
    getAllProductByName,
    getAllCategory,
    getProductOutstanding,
    getAddProductOutstanding,
    postAddProductOutstanding,
    postDeleteProductOutstanding,
    getUpdateProductOutstanding,
    postUpdateProductOutstanding,
    getAllProductOutstanding,
    getAllCategoryByName,
    getAddToCart,
    postAddToCart,
};
