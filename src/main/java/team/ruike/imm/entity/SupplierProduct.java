package team.ruike.imm.entity;
/**
 * @author 闫琛昊
 * @version 2.0
 *供应商产品
 */
public class SupplierProduct {
    /**
     * 编号
     */
    private int supplierProductId;
    /**
     * 商品编号
     */
    private Merchandise merchandise;
    /**
     * 供应商
     */
    private Supplier supplier;
    /**
     * 是否已删除
     */
    private Integer supplierProductState;

    public Integer getSupplierProductState() {
        return supplierProductState;
    }

    public void setSupplierProductState(Integer supplierProductState) {
        this.supplierProductState = supplierProductState;
    }

    public int getSupplierProductId() {
        return supplierProductId;
    }

    public void setSupplierProductId(int supplierProductId) {
        this.supplierProductId = supplierProductId;
    }

    public Merchandise getMerchandise() {
        return merchandise;
    }

    public void setMerchandise(Merchandise merchandise) {
        this.merchandise = merchandise;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }
}
