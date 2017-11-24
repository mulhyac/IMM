package team.runke.imm.entity;

import java.util.List;

/**
 * @author 闫琛昊
 * @version 2.0
 *供应商信息
 */
public class Supplier {
    /**
     * 供应商编号
     */
    private Integer supplierId;
    /**
     * 供应商名称
     */
    private String supplierName;
    /**
     * 负责人名称
     */
    private String supplierPersonInCharge;
    /**
     * 负责人职称
     */
    private String supplierPost;
    /**
     * 电话
     */
    private String supplierPhone;
    /**
     * 移动电话
     */
    private String supplierMobilePhone;
    /**
     * 传真
     */
    private String supplierFax;
    /**
     * 供应商地址
     */
    private String supplierAddress;
    /**
     * 工厂地址
     */
    private String supplierFactoryAddress;
    /**
     * 供应商产品表
     */
    private List<SupplierProduct> supplierProduct;
    /**
     * 是否已删除
     */
    private Integer supplier_state;

    public Integer getSupplier_state() {
        return supplier_state;
    }

    public void setSupplier_state(Integer supplier_state) {
        this.supplier_state = supplier_state;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getSupplierPersonInCharge() {
        return supplierPersonInCharge;
    }

    public void setSupplierPersonInCharge(String supplierPersonInCharge) {
        this.supplierPersonInCharge = supplierPersonInCharge;
    }

    public String getSupplierPost() {
        return supplierPost;
    }

    public void setSupplierPost(String supplierPost) {
        this.supplierPost = supplierPost;
    }

    public String getSupplierPhone() {
        return supplierPhone;
    }

    public void setSupplierPhone(String supplierPhone) {
        this.supplierPhone = supplierPhone;
    }

    public String getSupplierMobilePhone() {
        return supplierMobilePhone;
    }

    public void setSupplierMobilePhone(String supplierMobilePhone) {
        this.supplierMobilePhone = supplierMobilePhone;
    }

    public String getSupplierFax() {
        return supplierFax;
    }

    public void setSupplierFax(String supplierFax) {
        this.supplierFax = supplierFax;
    }

    public String getSupplierAddress() {
        return supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress;
    }

    public String getSupplierFactoryAddress() {
        return supplierFactoryAddress;
    }

    public void setSupplierFactoryAddress(String supplierFactoryAddress) {
        this.supplierFactoryAddress = supplierFactoryAddress;
    }
    public List<SupplierProduct> getSupplierProduct() {
        return supplierProduct;
    }

    public void setSupplierProduct(List<SupplierProduct> supplierProduct) {
        this.supplierProduct = supplierProduct;
    }
}
