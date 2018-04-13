package org.epo.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.epo.dao.CmsDao;
import org.epo.exception.CustomException;
import org.epo.readDossier.ApplicationProcedureBiblioAttribute;
import org.epo.readDossier.DossierInfo;
import org.epo.readDossier.ProductOrderAttribute;
import org.epo.readDossier.ProductOrderInvolvement;
import org.epo.readDossier.ProductTypeAttribute;
import org.epo.readDossier.TimeLimit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CmsDaoImpl implements CmsDao {

	@Autowired
	private Connection conn;

	public String insertDossierInfo(DossierInfo dossierInfo) throws CustomException {

		System.out.println("Dossier Details on Dao : " + dossierInfo);

		CallableStatement cstmtDossierInfo = null;
		CallableStatement cstmtBiblo = null;
		CallableStatement cstmtOrderAttr = null;
		CallableStatement cstmtOrderInv = null;
		CallableStatement cstmtTimeLimit = null;
		CallableStatement cstmtProdTypeAttr = null;
		ResultSet rs = null;
		String productOrderId = "";
		String applicationId = "";
		String productId = "";
		String status = "Success";

		try {

			/*
			 * cstmtDossierInfo =
			 * conn.prepareCall("{call ProceduralDataMgmt.Testing(?,?)}");
			 * cstmtDossierInfo.setString("DossierNo",
			 * dossierInfo.getDossierDetail().getDossierNumber());
			 * cstmtDossierInfo.registerOutParameter("ProductOrderOut",
			 * java.sql.Types.VARCHAR);
			 */

			// ReceiptDatetime VARCHAR(100),

			cstmtDossierInfo = conn.prepareCall("{call ProceduralDataMgmt.SP_Create_TestData_Main(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");

			// cstmtDossierInfo.setString("DossierNo",
			// dossierInfo.getDossierDetail().getApplicationId());
			// cstmtDossierInfo.setString("DossierNo",
			// dossierInfo.getDossierDetail().getParentBusinessTaskId());
			// cstmtDossierInfo.setString("DossierNo",
			// dossierInfo.getDossierDetail().getProductOrderId());
			cstmtDossierInfo.setString("DossierNumber", dossierInfo.getDossierDetail().getDossierNumber());
			cstmtDossierInfo.setString("Directorate", dossierInfo.getDossierDetail().getDirectorate());
			cstmtDossierInfo.setString("ApplicantEmail", dossierInfo.getDossierDetail().getApplicantEmail());
			cstmtDossierInfo.setString("ApplicantName", dossierInfo.getDossierDetail().getApplicantName());
			cstmtDossierInfo.setString("ApplicantPhoneNumber",dossierInfo.getDossierDetail().getApplicantPhoneNumber());
			cstmtDossierInfo.setString("BusinessTaskTypeName", dossierInfo.getDossierDetail().getBusinessTaskTypeName());
			cstmtDossierInfo.setString("ClassificationDescription",	dossierInfo.getDossierDetail().getClassificationDescription());
			cstmtDossierInfo.setString("ClassificationType", dossierInfo.getDossierDetail().getClassificationType());
			cstmtDossierInfo.setString("ClassSymbol", dossierInfo.getDossierDetail().getClassSymbol());
			cstmtDossierInfo.setString("eDossierFlag", dossierInfo.getDossierDetail().getEDossierFlag());
			cstmtDossierInfo.setString("ExternalTaskId", dossierInfo.getDossierDetail().getExternalTaskId());
			cstmtDossierInfo.setString("IsFirstApplicant", dossierInfo.getDossierDetail().getIsFirstApplicant());
			cstmtDossierInfo.setString("LabelDescription", dossierInfo.getDossierDetail().getLabelDescription());
			cstmtDossierInfo.setString("LabelValue", dossierInfo.getDossierDetail().getLabelValue());
			cstmtDossierInfo.setString("LeadClassFlag", dossierInfo.getDossierDetail().getLeadClassFlag());
			cstmtDossierInfo.setString("LegacyProductOrderStatus", dossierInfo.getDossierDetail().getLegacyProductOrderStatus());
			cstmtDossierInfo.setString("Priority", dossierInfo.getDossierDetail().getPriority());
			cstmtDossierInfo.setString("Ranking", dossierInfo.getDossierDetail().getRanking());
			cstmtDossierInfo.setString("RepresentativeEmail", dossierInfo.getDossierDetail().getRepresentativeEmail());
			cstmtDossierInfo.setString("RepresentativeName", dossierInfo.getDossierDetail().getRepresentativeName());
			cstmtDossierInfo.setString("RepresentativePhoneNumber", dossierInfo.getDossierDetail().getRepresentativePhoneNumber());
			cstmtDossierInfo.setString("Source", dossierInfo.getDossierDetail().getSource());
			cstmtDossierInfo.setString("TaskComments", dossierInfo.getDossierDetail().getTaskComments());
			cstmtDossierInfo.setString("TaskCreatedBy", dossierInfo.getDossierDetail().getTaskCreatedBy());
			cstmtDossierInfo.setString("TaskOwner", dossierInfo.getDossierDetail().getTaskOwner());
			cstmtDossierInfo.setString("TaskStatus", dossierInfo.getDossierDetail().getTaskStatus());
			cstmtDossierInfo.setString("ReceiptDatetime", "05/04/2018");
			cstmtDossierInfo.setString("ProductTypeName", dossierInfo.getDossierDetail().getProductTypeName());
			cstmtDossierInfo.registerOutParameter("ApplicationId", java.sql.Types.VARCHAR);
			cstmtDossierInfo.registerOutParameter("ProductOrderId", java.sql.Types.VARCHAR);
			cstmtDossierInfo.registerOutParameter("ProductId", java.sql.Types.VARCHAR);

			cstmtDossierInfo.execute();

			productOrderId = cstmtDossierInfo.getString("ProductOrderId");
			applicationId = cstmtDossierInfo.getString("ApplicationId");
			productId = cstmtDossierInfo.getString("ProductId");
			
			System.out.println("Product Order Id from Stored Procedure : " + productOrderId);
			System.out.println("Application Id from Stored Procedure : " + applicationId);
			System.out.println("Product Id from Stored Procedure : " + productId);

			for (ApplicationProcedureBiblioAttribute appBibloAttr : dossierInfo.getApplicationProcedureBiblioAttribute()) {
				cstmtBiblo = conn.prepareCall("{call ProceduralDataMgmt.SP_Create_TestData_ApplicationProcedureBiblioAttributeValue(?,?,?)}");
				cstmtBiblo.setString("ApplicationId", applicationId);
				cstmtBiblo.setString("ApplicationProcedureBiblioAttributeName",appBibloAttr.getApplicationProcedureBiblioAttributeName());
				cstmtBiblo.setString("ApplicationProcedureBiblioAttributeValue",appBibloAttr.getApplicationProcedureBiblioAttributeValue());

				cstmtBiblo.execute();
			}

			for (ProductOrderAttribute productOrderAttr : dossierInfo.getProductOrderAttribute()) {
				cstmtOrderAttr = conn.prepareCall("{call ProceduralDataMgmt.SP_Create_TestData_ProductOrderAttributeValue(?,?,?)}");
				cstmtOrderAttr.setString("ProductOrderId", productOrderId);
				cstmtOrderAttr.setString("ProductOrderTypeAttributeName",productOrderAttr.getProductOrderTypeAttributeName());
				cstmtOrderAttr.setString("ProductOrderTypeAttributeValue",productOrderAttr.getProductOrderTypeAttributeValue());

				cstmtOrderAttr.execute();
			}

			for (ProductOrderInvolvement productOrderInv : dossierInfo.getProductOrderInvolvement()) {
				cstmtOrderInv = conn.prepareCall("{call ProceduralDataMgmt.SP_Create_TestData_ProductOrderInvolvement(?,?,?,?)}");
				cstmtOrderInv.setString("ProductOrderId", productOrderId);
				cstmtOrderInv.setString("InvolvementRole", productOrderInv.getInvolvementRole());
				cstmtOrderInv.setString("InvolvementUser", productOrderInv.getInvolvementUser());
				cstmtOrderInv.setString("ProposedFlag", productOrderInv.getProposedFlag());

				cstmtOrderInv.execute();
			}

			for (TimeLimit timeLimit : dossierInfo.getTimeLimit()) {
				cstmtTimeLimit = conn.prepareCall("{call ProceduralDataMgmt.SP_Create_TestData_TimeLimitValue(?,?,?,?,?)}");
				cstmtTimeLimit.setString("ApplicationId", applicationId);
				cstmtTimeLimit.setString("ProductOrderId", productOrderId);
				// cstmtTimeLimit.setString("BusinessTaskId", timeLimit.getBusinessTaskId());
				cstmtTimeLimit.setString("LimitDateType", timeLimit.getLimitDateType());
				cstmtTimeLimit.setString("TimeLimitTypeDesc", timeLimit.getTimeLimitTypeDesc());
				cstmtTimeLimit.setString("TimeLimitValue", timeLimit.getTimeLimitValue());

				cstmtTimeLimit.execute();
			}
			
			for (ProductTypeAttribute prodTypeAttr : dossierInfo.getProductTypeAttribute()) {
				cstmtProdTypeAttr = conn.prepareCall("{call ProceduralDataMgmt.SP_Create_TestData_ProductAttributeValue(?,?,?)}");
				cstmtProdTypeAttr.setString("ProductId", productId);
				cstmtProdTypeAttr.setString("ProductTypeAttributeName", prodTypeAttr.getProductTypeAttributeName());
				cstmtProdTypeAttr.setString("ProductTypeAttributeValue", prodTypeAttr.getProductTypeAttributeValue());

				cstmtProdTypeAttr.execute();
			}

		} catch (Exception ex) {
			status = "Failure";
			ex.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (cstmtDossierInfo != null) {
				try {
					cstmtDossierInfo.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (cstmtBiblo != null) {
				try {
					cstmtBiblo.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (cstmtOrderAttr != null) {
				try {
					cstmtOrderAttr.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (cstmtOrderInv != null) {
				try {
					cstmtOrderInv.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (cstmtTimeLimit != null) {
				try {
					cstmtTimeLimit.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (cstmtProdTypeAttr != null) {
				try {
					cstmtProdTypeAttr.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}

		return status;
	}

	public String getDocMasterData() throws CustomException {
		String DocDetails = "";

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs;
			rs = stmt.executeQuery("SELECT DocCodeId, DocCode, DescEn, DescFr, DescDe FROM DocumentManagement.DocCodeMaster");
			while (rs.next()) {
				DocDetails = rs.getString("DocCode") + " , " + rs.getString("DescEn") + " , " + rs.getString("DescFr")
						+ " , " + rs.getString("DescDe");
				System.out.println(DocDetails);
			}
			conn.close();
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}

		return DocDetails;
	}

}
