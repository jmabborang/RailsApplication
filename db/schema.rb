# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_11_26_110008) do
  create_table "dtproperties", primary_key: ["id", "property"], force: :cascade do |t|
    t.integer "id", null: false
    t.string "lvalue"
    t.integer "objectid"
    t.varchar "property", limit: 64, null: false
    t.string "uvalue", limit: 255
    t.varchar "value", limit: 255
    t.integer "version", default: 0, null: false
  end

  create_table "tbl13thMonthRoundDirections", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "Name", limit: 50, null: false
  end

  create_table "tbl13thMonthTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "Name", limit: 50, null: false
  end

  create_table "tblAcademicLevels", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Name", limit: 50, null: false
  end

  create_table "tblAccessControlList", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CreatedById", null: false
    t.datetime "CreationDate", precision: nil
    t.varchar "IPAddress", limit: 250, null: false
    t.datetime "ModificationDate", precision: nil
    t.integer "ModifiedById"
    t.integer "VersionNo", default: 1, null: false
    t.index ["IPAddress"], name: "IX_tblAccessControlList_IPAddress"
  end

  create_table "tblAddOns", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AddOnsStatusId", null: false
    t.varchar "Code", limit: 100, null: false
    t.varchar "Description", limit: 800
    t.boolean "IsClose", null: false
    t.varchar "LockedDescription", limit: 500
    t.varchar "Name", limit: 100, null: false
    t.varchar "UnlockedDescription", limit: 500
    t.varchar "WebLink", limit: 500
  end

  create_table "tblAddOnsStatus", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AddOnsId", null: false
    t.integer "AddOnsStatusImageId", null: false
    t.integer "CompanyId", null: false
    t.boolean "IsClose", default: true, null: false
  end

  create_table "tblAddOnsStatusImage", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Image"
    t.varchar "Name", limit: 100, null: false
  end

  create_table "tblAdditionalSignatories", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "SignName", limit: 200
    t.varchar "SignPosition", limit: 500
    t.integer "SignatoryTypeId", null: false
    t.string "Signature"
  end

  create_table "tblAdditionalSignatoryTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId", null: false
    t.varchar "Name", limit: 200, null: false
  end

  create_table "tblAddressTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "AddressType", limit: 250, null: false
  end

  create_table "tblAlphalistDisketteTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "Type", limit: 50, null: false
  end

  create_table "tblAlphalistTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Code", limit: 50, null: false
    t.varchar "FormType", limit: 50, null: false
    t.varchar "Name", limit: 50, null: false
    t.varchar "ScheduleNumber", limit: 50, null: false
    t.varchar "SysCode", limit: 50, null: false
  end

  create_table "tblAlphanumericTaxCodes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Code", limit: 50
    t.integer "CreatedById"
    t.datetime "CreationDate", precision: nil
    t.boolean "IsEWT", default: false, null: false
    t.boolean "IsFBTax", default: false, null: false
    t.boolean "IsFinalTax", default: false, null: false
    t.boolean "IsNRANETB", default: false, null: false
    t.datetime "ModificationDate", precision: nil
    t.integer "ModifiedById"
    t.varchar "Name", limit: 500
    t.money "Rate", precision: 19, scale: 4
    t.varchar "Remarks", limit: 2000
    t.integer "VersionNo", default: 1, null: false
  end

  create_table "tblAmountTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Name", limit: 50, null: false
  end

  create_table "tblAnnualIncomeTaxReturn1700", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.money "AdditionalExemption", precision: 19, scale: 4, default: 0.0, null: false
    t.money "AggregateAmountPayableRefund", precision: 19, scale: 4, default: 0.0, null: false
    t.money "AmountIfCTC", precision: 19, scale: 4
    t.integer "CompanyId", null: false
    t.money "Compromise", precision: 19, scale: 4, default: 0.0, null: false
    t.datetime "DateOfIssue", precision: nil
    t.datetime "DateOfPayment", precision: nil
    t.integer "EmployeeId", null: false
    t.money "EmployeeTaxWithheld", precision: 19, scale: 4, default: 0.0, null: false
    t.money "ForeignTaxCredits", precision: 19, scale: 4, default: 0.0, null: false
    t.varchar "GovernmentIssuedId", limit: 50
    t.money "Gross", precision: 19, scale: 4, default: 0.0, null: false
    t.money "GrossTaxable", precision: 19, scale: 4, default: 0.0, null: false
    t.money "InitialGrossCompensationIncome", precision: 19, scale: 4, default: 0.0, null: false
    t.money "Interest", precision: 19, scale: 4, default: 0.0, null: false
    t.boolean "IsAmmendedReturn", default: false, null: false
    t.boolean "IsClamingForAdditionalExemptions", default: false, null: false
    t.boolean "IsClosed", default: false, null: false
    t.boolean "IsJointFiling", default: false, null: false
    t.money "NetTaxable", precision: 19, scale: 4, default: 0.0, null: false
    t.money "NetTaxablePayableRefund", precision: 19, scale: 4, default: 0.0, null: false
    t.integer "NoOfQualifiedDependentChildren"
    t.money "NonTaxable", precision: 19, scale: 4, default: 0.0, null: false
    t.money "OtherCompensationIncome", precision: 19, scale: 4, default: 0.0, null: false
    t.money "OtherPaymentsCredits", precision: 19, scale: 4, default: 0.0, null: false
    t.money "OtherTaxable", precision: 19, scale: 4, default: 0.0, null: false
    t.varchar "PSOCCode", limit: 300
    t.integer "PayOutTypeId"
    t.integer "PayYear", null: false
    t.money "PersonalExemption", precision: 19, scale: 4, default: 0.0, null: false
    t.varchar "PlaceOfIssue", limit: 300
    t.money "PremiumOnHealth", precision: 19, scale: 4, default: 0.0, null: false
    t.varchar "Specify", limit: 500
    t.money "Surcharge", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TaxDue", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TaxPaidInReturn", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TaxPayableInstallment", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TaxRequired", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TaxWithheld", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TotalAmountPayableRefund", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TotalDeductions", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TotalPenalties", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TotalTaxCreditsPayments", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TotalTaxable", precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tblAnnualIncomeTaxReturn1700Details", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.money "Amount", precision: 19, scale: 4, default: 0.0, null: false
    t.money "AmountInPeso", precision: 19, scale: 4, default: 0.0, null: false
    t.integer "AnnualIncomeTaxReturn1700Id", null: false
    t.integer "CurrencyId"
    t.float "ExchangeRate", default: 0.0, null: false
    t.varchar "NameOfEmployer", limit: 150
    t.varchar "Particular", limit: 500
    t.varchar "TIN", limit: 50
    t.money "TaxWithHeld", precision: 19, scale: 4, default: 0.0, null: false
    t.index ["AnnualIncomeTaxReturn1700Id"], name: "IX_tblAnnualIncomeTaxReturn1700Details_AnnualIncomeTaxReturn1700Id"
  end

  create_table "tblAnnualInformationReturn", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId", null: false
    t.integer "CreatedById", null: false
    t.datetime "CreationDate", precision: nil, null: false
    t.datetime "DateOfTaxRefund", precision: nil
    t.datetime "DateofExpiry", precision: nil
    t.datetime "DateofIssue", precision: nil
    t.integer "ITRType"
    t.boolean "IsAmendedReturn", default: false, null: false
    t.boolean "IsClosed", default: false, null: false
    t.boolean "IsTaxRefundReleased", default: false, null: false
    t.datetime "ModificationDate", precision: nil
    t.integer "ModifiedById"
    t.integer "MonthofFirstCrediting", default: 1, null: false
    t.varchar "Number", limit: 50, null: false
    t.integer "NumberOfSheets"
    t.integer "PayYear", null: false
    t.varchar "Remarks", limit: 500
    t.varchar "TaxAgentAttorneyNo", limit: 50
    t.varchar "TaxAgentNumber", limit: 50
    t.varchar "TaxRelief", limit: 50
    t.boolean "TopWithholdingAgent", default: false, null: false
    t.money "TotalAmountOfOverRemit", precision: 19, scale: 4, default: 0.0, null: false
    t.boolean "isAvailingTaxRelief", default: false, null: false
  end

  create_table "tblAnnualInformationReturn1604C", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.money "Adjustment", precision: 19, scale: 4, default: 0.0, null: false
    t.integer "AnnualInformationReturnId", null: false
    t.datetime "DateOfRemittance", precision: nil, null: false
    t.varchar "DraweeBankAgency", limit: 50
    t.varchar "ORNumber", limit: 50
    t.integer "PayMonth", null: false
    t.money "Penalties", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TaxesWithheld", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TotalAmountRemitted", precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tblAnnualInformationReturn1604E", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AnnualInformationReturnId", null: false
    t.datetime "DateOfRemittance", precision: nil, null: false
    t.varchar "DraweeBankAgency", limit: 50
    t.varchar "ORNumber", limit: 50
    t.money "Penalties", precision: 19, scale: 4, default: 0.0, null: false
    t.integer "Quarter", null: false
    t.money "TaxesWithheld", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TotalAmountRemitted", precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tblAnnualInformationReturn1604F", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AnnualInformationReturnId", null: false
    t.datetime "DateOfRemittance", precision: nil, null: false
    t.varchar "DraweeBankAgency", limit: 50
    t.varchar "ORNumber", limit: 50
    t.money "Penalties", precision: 19, scale: 4, default: 0.0, null: false
    t.integer "Quarter", null: false
    t.integer "ReportType", null: false
    t.money "TaxesWithheld", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TotalAmountRemitted", precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tblAnnualInformationReturnDetails", primary_key: ["AnnualInformationReturnId", "PayMonth"], force: :cascade do |t|
    t.money "Adjustment", precision: 19, scale: 4, default: 0.0, null: false
    t.integer "AnnualInformationReturnId", null: false
    t.datetime "DateOfRemittance", precision: nil, null: false
    t.varchar "ORNumber", limit: 50
    t.integer "PayMonth", null: false
    t.money "Penalties", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TaxesWithheld", precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tblAnnualInformationReturnSchedule2Details", primary_key: ["AnnualInformationReturnId", "PayMonth"], force: :cascade do |t|
    t.integer "AnnualInformationReturnId", null: false
    t.datetime "DateOfRemittance", precision: nil, null: false
    t.varchar "ORNumber", limit: 50
    t.integer "PayMonth", null: false
    t.money "Penalties", precision: 19, scale: 4, default: 0.0, null: false
    t.money "TaxesWithheld", precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tblAnnualInformationReturnSchedule4Details", primary_key: ["AnnualInformationReturnId", "Quarter"], force: :cascade do |t|
    t.integer "AnnualInformationReturnId", null: false
    t.datetime "DateOfRemittance", precision: nil, null: false
    t.varchar "ORNumber", limit: 50
    t.money "Penalties", precision: 19, scale: 4, default: 0.0, null: false
    t.integer "Quarter", null: false
    t.money "TaxesWithheld", precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "tblApproverGroupDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Approve201Updates", default: false, null: false
    t.boolean "ApproveChangeShiftSchedule", default: true, null: false
    t.boolean "ApproveLeave", default: true, null: false
    t.boolean "ApproveLeaveConversion", default: true, null: false
    t.boolean "ApproveOB", default: true, null: false
    t.boolean "ApproveOT", default: true, null: false
    t.boolean "ApproveReimbursement", default: true, null: false
    t.boolean "ApproveRequest", default: false, null: false
    t.boolean "ApproveShiftGroup", default: true, null: false
    t.boolean "ApproveTimelog", default: true, null: false
    t.boolean "ApproveUT", default: true, null: false
    t.integer "ApproverGroupId", null: false
    t.integer "EmployeeId", null: false
    t.boolean "IsNotify", default: true, null: false
    t.boolean "IsRequired", default: false, null: false
    t.integer "SequenceNo"
  end

  create_table "tblApproverGroups", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Code", limit: 250
    t.integer "CompanyId", null: false
    t.varchar "Name", limit: 250
  end

  create_table "tblAreasForDevelopmentActionSteps", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "ActionStep", limit: 250
    t.datetime "CompletionDate", precision: nil
    t.integer "ReviewDetailId", null: false
  end

  create_table "tblAttendanceTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "Code", limit: 50, null: false
    t.varchar "Name", limit: 50, null: false
    t.varchar "SysCode", limit: 50, null: false
  end

  create_table "tblAuditTrailAccessControlList", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AccessControlListId", null: false
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "IPAddress", limit: 250
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailAccessControlListDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailAccessControlListId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailAlphanumericTaxCodeDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailAlphanumericTaxCodeId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailAlphanumericTaxCodes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "AlphanumericTaxCode", limit: 50
    t.integer "AlphanumericTaxCodeId", null: false
    t.varchar "AlphanumericTaxCodeName", limit: 500
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailBackup", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "DBFileName", limit: 500, null: false
    t.varchar "DBName", limit: 50, null: false
    t.datetime "Date", precision: nil, null: false
    t.integer "SecurityUserId", null: false
  end

  create_table "tblAuditTrailBankAccountDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailBankAccountId", null: false
    t.varchar "FieldName", limit: 50
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailBankAccounts", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "BankAccountId", null: false
    t.varchar "BankAccountName", limit: 50
    t.varchar "BankAccountNo", limit: 50
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailChangeDailyScheduleDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailChangeDailyScheduleId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailChangeDailySchedules", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.datetime "ChangeDailyScheduleDate", precision: nil
    t.integer "ChangeDailyScheduleEmployeeId"
    t.integer "ChangeDailyScheduleId", null: false
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.index ["CompanyId", "LineNo"], name: "IX_tblAuditTrailChangeDailySchedules_CompanyId_LineNo"
  end

  create_table "tblAuditTrailClassDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailClassId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailClasses", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.varchar "ClassCode", limit: 50
    t.integer "ClassId", null: false
    t.varchar "ClassName", limit: 50
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailClearanceStatus", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", null: false
    t.integer "ClearanceStatusId", null: false
    t.varchar "Code", limit: 50, null: false
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "Name", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailClearanceStatusDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailClearanceStatusId", null: false
    t.varchar "FieldName", limit: 256, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailClientDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailClientId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailClients", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ClientId", null: false
    t.varchar "ClientName", limit: 50
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailCompanies", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.varchar "CompanyName", limit: 500
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailCompanyDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailCompanyId", null: false
    t.varchar "FieldName", limit: 100
    t.varchar_max "NewValue"
    t.varchar_max "OldValue"
  end

  create_table "tblAuditTrailCompanyHealthProgramCategories", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyHealthProgramCategoryId", null: false
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "HealthProgramCategoryName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailCompanyHealthProgramCategoryDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailCompanyHealthProgramCategoryId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 250
    t.varchar "OldValue", limit: 250
  end

  create_table "tblAuditTrailCompanyHealthProgramDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailCompanyHealthProgramId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 250
    t.varchar "OldValue", limit: 250
  end

  create_table "tblAuditTrailCompanyHealthPrograms", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyHealthProgramId", null: false
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "HealthProgramName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailCostCenterDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailCostCenterId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailCostCenters", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.varchar "CostCenterCode", limit: 50
    t.integer "CostCenterId", null: false
    t.varchar "CostCenterName", limit: 50
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailCustomGroupDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailCustomGroupId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailCustomGroups", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.varchar "CustomGroupCode", limit: 50
    t.integer "CustomGroupId", null: false
    t.varchar "CustomGroupName", limit: 50
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailDeMinimis", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "DeMinimisCode", limit: 50
    t.varchar "DeMinimisCodeName", limit: 500
    t.integer "DeMinimisId", null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailDeMinimisDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailDeMinimisId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailDepartmentDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailDepartmentId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailDepartments", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "DepartmentCode", limit: 500, null: false
    t.integer "DepartmentId", null: false
    t.varchar "DepartmentName", limit: 500, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailDeviceDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailDeviceId"
    t.varchar "FieldName", limit: 50
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailDevices", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil
    t.varchar "Device", limit: 50
    t.integer "DeviceId"
    t.varchar "DeviceName", limit: 50
    t.integer "EmployeeId"
    t.integer "FingerIndex"
    t.integer "LineNo"
    t.varchar "Mode", limit: 50
    t.integer "SecurityUserId"
    t.varchar "Terminal", limit: 50
  end

  create_table "tblAuditTrailESSManager", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.integer "WebkioskRequestTypesId"
  end

  create_table "tblAuditTrailESSManagerDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailESSManagerId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailEmployeeDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailEmployeeId", null: false
    t.integer "EmployeeId"
    t.varchar "FieldName", limit: 50, null: false
    t.integer "LineNo"
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
    t.index ["AuditTrailEmployeeId"], name: "IX_tblAuditTrailEmployeeDetails_AuditTrailEmployeeId", include: ["FieldName", "OldValue", "NewValue"]
  end

  create_table "tblAuditTrailEmployeeDevices", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId", null: false
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil
    t.varchar "Device", limit: 50
    t.integer "DeviceId"
    t.integer "EmployeeId"
    t.integer "FingerIndex"
    t.varchar "Mode", limit: 50
    t.integer "SecurityUserId"
    t.varchar "Terminal", limit: 50
  end

  create_table "tblAuditTrailEmployeeHistories", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),(0)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "EmployeeCode", limit: 50, null: false
    t.integer "EmployeeId", null: false
    t.varchar "EmployeeName", limit: 50, null: false
    t.varchar "HistoryTabName", limit: 50, null: false
    t.integer "HistoryTabNameId", null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.integer "VersionNo"
  end

  create_table "tblAuditTrailEmployeeHistoryDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailEmployeeHistoryId", null: false
    t.varchar "FieldName", limit: 100, null: false
    t.varchar "NewValue", limit: 100
    t.varchar "OldValue", limit: 100
  end

  create_table "tblAuditTrailEmployeeHistoryOffenses", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),(0)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "EmployeeCode", limit: 50, null: false
    t.integer "EmployeeId", null: false
    t.varchar "EmployeeName", limit: 50, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.integer "VersionNo"
  end

  create_table "tblAuditTrailEmployeeHistoryOffensesDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailOffensesId", null: false
    t.varchar "FieldName", limit: 150, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailEmployeeLimit", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeLimitId"
    t.varchar "EmployeeLimitLimit", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailEmployeeLimitDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailEmployeeLimitId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailEmployeeMedical", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "EmployeeCode", limit: 50
    t.integer "EmployeeId", null: false
    t.varchar "EmployeeName", limit: 250
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailEmployeeMedicalDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailEmployeeId", null: false
    t.varchar "FieldName", limit: 250, null: false
    t.varchar "NewValue", limit: 2500
    t.varchar "OldValue", limit: 2500
    t.index ["AuditTrailEmployeeId"], name: "IX_tblAuditTrailEmployeeMedicalDetails_AuditTrailEmployeeId"
  end

  create_table "tblAuditTrailEmployeeSuffixName", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeSuffixNameId"
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.varchar "Suffix", limit: 100
  end

  create_table "tblAuditTrailEmployeeSuffixNameDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailEmployeeSuffixNameId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailEmployeeTransferTypeDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailEmployeeTransferTypeId", null: false
    t.varchar "FieldName", limit: 256, null: false
    t.varchar "NewValue", limit: 500, null: false
    t.varchar "OldValue", limit: 500, null: false
  end

  create_table "tblAuditTrailEmployeeTransferTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeTransferTypeId", null: false
    t.varchar "Field", limit: 250, null: false
    t.boolean "IsShowOnWebkiosk", default: true, null: false
    t.integer "LineNo", null: false
    t.varchar "Mode", limit: 50, null: false
    t.varchar "Name", limit: 250, null: false
    t.integer "SecurityUserId", null: false
    t.varchar "TableName", limit: 250
  end

  create_table "tblAuditTrailEmployees", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "EmployeeCode", limit: 250
    t.integer "EmployeeId", null: false
    t.varchar "EmployeeName", limit: 250
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.index ["CompanyId"], name: "IX_tblAuditTrailEmployees_CompanyId", include: ["LineNo"]
    t.index ["EmployeeId", "CompanyId"], name: "IX_tblAuditTrailEmployees_EmployeeId_CompanyId", include: ["LineNo"]
  end

  create_table "tblAuditTrailEmploymentTypeDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailEmploymentTypeId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailEmploymentTypes", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "EmploymentTypeCode", limit: 50
    t.integer "EmploymentTypeId", null: false
    t.varchar "EmploymentTypeName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailHDMF", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "HDMFBracket"
    t.integer "HDMFId", null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailHDMFDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailHDMFId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailHalfDayFiling", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeId"
    t.datetime "FilingDate", precision: nil, null: false
    t.integer "HalfDayFilingId", null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "Number", limit: 150
    t.integer "SecurityUserId"
    t.varchar "Type", limit: 150
  end

  create_table "tblAuditTrailHalfDayFilingDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailHalfDayFilingId", null: false
    t.varchar "FieldName", limit: 256, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailHolidayDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailHolidayId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailHolidayTemplateDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailHolidayTemplateId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailHolidayTemplates", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DATETIME],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "HolidayTemplateId"
    t.varchar "HolidayTemplateName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailHolidays", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "HolidayId", null: false
    t.varchar "HolidayName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailIndicatorSectorDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailIndicatorSectorId", null: false
    t.varchar "FieldName", limit: 500, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailIndicatorSectors", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(dateadd(day,datediff(day,(0),[DateTime]),(0)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "IndicatorSectorCode", limit: 50
    t.integer "IndicatorSectorId", null: false
    t.varchar "IndicatorSectorName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailLeaveAccrual", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "Description", limit: 250
    t.varchar "DetailLeaveType", limit: 150
    t.integer "EmployeeId"
    t.boolean "IsClosed", null: false
    t.integer "LeaveAccrualId", null: false
    t.datetime "LeaveDate", precision: nil, null: false
    t.varchar "LeaveType", limit: 150
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailLeaveAccrualDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailLeaveAccrualId", null: false
    t.varchar "FieldName", limit: 256, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailLeaveAccrualScheduleDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailLeaveAccrualScheduleId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailLeaveAccrualSchedules", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LeaveAccrualScheduleId", null: false
    t.varchar "LeaveAccrualScheduleName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailLeaveFiling", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.datetime "LeaveFilingDate", precision: nil
    t.integer "LeaveFilingEmployeeId"
    t.integer "LeaveFilingId", null: false
    t.integer "LeaveFilingLeaveTypeId"
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.index ["CompanyId", "LineNo"], name: "IX_tblAuditTrailLeaveFiling_CompanyId_LineNo"
  end

  create_table "tblAuditTrailLeaveFilingDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailLeaveFilingId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailLeaveForfeitScheduleDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailLeaveForfeitScheduleId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailLeaveForfeitSchedules", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil
    t.integer "LeaveForfeitScheduleId"
    t.varchar "LeaveForfeitScheduleName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailLeaveJournal", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "Description", limit: 250
    t.varchar "DetailLeaveType", limit: 150
    t.integer "EmployeeId"
    t.boolean "IsClosed", null: false
    t.boolean "IsForfeit", null: false
    t.datetime "LeaveDate", precision: nil, null: false
    t.integer "LeaveJournalId", null: false
    t.varchar "LeaveType", limit: 150, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailLeaveJournalDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailLeaveJournalId", null: false
    t.varchar "FieldName", limit: 256, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailLeaveProjectionScheduleDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailLeaveProjectionScheduleId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailLeaveProjectionSchedules", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),(0)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LeaveProjectionScheduleId", null: false
    t.varchar "LeaveProjectionScheduleName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailLeaveTypeDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailLeaveTypeId", null: false
    t.varchar "FieldName", limit: 100
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailLeaveTypes", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "LeaveTypeCode", limit: 50
    t.integer "LeaveTypeId", null: false
    t.varchar "LeaveTypeName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailLoanDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailLoanId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailLoans", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "Description", limit: 50
    t.integer "LineNo"
    t.integer "LoanEmployeeId"
    t.integer "LoanId", null: false
    t.integer "LoanPayElementId"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "Number", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailLocationDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailLocationId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailLocations", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "LocationCode", limit: 50
    t.integer "LocationId", null: false
    t.varchar "LocationName", limit: 50
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMaritalStatus", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.integer "MaritalStatusId", null: false
    t.varchar "MaritalStatusName", limit: 50
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMaritalStatusDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailMaritalStatusId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailMedicalAccidentDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailAccidentId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalAccidentTypeDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailAccidentTypeId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalAccidentTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "AccidentTypeCode", limit: 50
    t.integer "AccidentTypeId", null: false
    t.varchar "AccidentTypeName", limit: 50
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalAccidents", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "AccidentCode", limit: 50
    t.integer "AccidentId", null: false
    t.varchar "AccidentName", limit: 50
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalDesignationDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailDesignationId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalDesignations", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "DesignationCode", limit: 50
    t.integer "DesignationId", null: false
    t.varchar "DesignationName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalDiseaseCategories", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "DiseaseCategoryCode", limit: 50
    t.integer "DiseaseCategoryId", null: false
    t.varchar "DiseaseCategoryName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalDiseaseCategoryDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailDiseaseCategoryId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalDiseaseDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailDiseaseId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalDiseaseTypeDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailDiseaseTypeId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalDiseaseTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "DiseaseTypeCode", limit: 50
    t.integer "DiseaseTypeId", null: false
    t.varchar "DiseaseTypeName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalDiseases", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "DiseaseCode", limit: 50
    t.integer "DiseaseId", null: false
    t.varchar "DiseaseName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalExaminationDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailExaminationId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalExaminations", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "ExaminationCode", limit: 50
    t.integer "ExaminationId", null: false
    t.varchar "ExaminationName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalHazardDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailHazardId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalHazardTypeDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailHazardTypeId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalHazardTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "HazardTypeCode", limit: 50
    t.integer "HazardTypeId", null: false
    t.varchar "HazardTypeName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalHazards", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.varchar "HazardCode", limit: 50
    t.integer "HazardId", null: false
    t.varchar "HazardName", limit: 50
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalRatingCategories", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "RatingCategoryCode", limit: 50
    t.integer "RatingCategoryId", null: false
    t.varchar "RatingCategoryName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalRatingCategoryDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailRatingCategoryId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalRiskCategories", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "RiskCategoryCode", limit: 50
    t.integer "RiskCategoryId", null: false
    t.varchar "RiskCategoryName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicalRiskCategoryDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailRiskCategoryId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalStaff", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.varchar "StaffFormalName", limit: 250
    t.integer "StaffId", null: false
  end

  create_table "tblAuditTrailMedicalStaffDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailStaffId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 250
    t.varchar "OldValue", limit: 250
  end

  create_table "tblAuditTrailMedicalVaccineDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailVaccineId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicalVaccines", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.varchar "VaccineCode", limit: 50
    t.integer "VaccineId", null: false
    t.varchar "VaccineName", limit: 50
  end

  create_table "tblAuditTrailMedicineDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailMedicineId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicineMonitoring", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.integer "MedicineMonitoringId", null: false
    t.varchar "MedicineName", limit: 50
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMedicineMonitoringDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailMedicineMonitoringId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 50
    t.varchar "OldValue", limit: 50
  end

  create_table "tblAuditTrailMedicines", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.integer "MedicineId", null: false
    t.varchar "MedicineName", limit: 50
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMultipleHoliday", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],getdate(),(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "MultipleHolidayId", null: false
    t.varchar "MultipleHolidayName", limit: 500
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailMultipleHolidayDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailMultipleHolidayId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailNationality", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "NationalityCode", limit: 50
    t.integer "NationalityId", null: false
    t.varchar "NationalityName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailNationalityDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailNationalityId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailOBFiling", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "OBFilingDate", limit: 50
    t.integer "OBFilingEmployeeId"
    t.integer "OBFilingId", null: false
    t.varchar "OBFilingNumber", limit: 50
    t.integer "SecurityUserId"
    t.index ["CompanyId", "LineNo"], name: "IX_tblAuditTrailOBFiling_CompanyId_LineNo"
  end

  create_table "tblAuditTrailOBFilingDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailOBFilingId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailOTFiling", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "OTFilingDate", limit: 50
    t.integer "OTFilingEmployeeId"
    t.integer "OTFilingId", null: false
    t.varchar "OTFilingNumber", limit: 50
    t.integer "SecurityUserId"
    t.index ["CompanyId", "LineNo"], name: "IX_tblAuditTrailOTFiling_CompanyId_LineNo"
  end

  create_table "tblAuditTrailOTFilingDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailOTFilingId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailOffenseType", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", null: false
    t.varchar "Code", limit: 50, null: false
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "Name", limit: 50, null: false
    t.integer "OffenseTypeId", null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailOffenseTypeDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailOffenseTypeId", null: false
    t.varchar "FieldName", limit: 256, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailParameterDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailParameterId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailParameters", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "ParameterId", null: false
    t.varchar "ParameterName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailPayElementDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailPayElementId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailPayElementScheduleDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailPayElementScheduleId", null: false
    t.varchar "FieldName", limit: 500, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailPayElementSchedules", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "PayElementScheduleId", null: false
    t.varchar "PayElementScheduleName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailPayElements", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.boolean "BuiltIn", default: false, null: false
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.boolean "IsAllowance", default: false, null: false
    t.boolean "IsEarning", default: false, null: false
    t.boolean "IsLoan", default: false, null: false
    t.boolean "IsReimbursement", default: false, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "PayElementCode", limit: 50
    t.integer "PayElementId", null: false
    t.varchar "PayElementName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailPayGroupDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailPayGroupId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailPayGroups", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "PayGroupCode", limit: 50
    t.integer "PayGroupId", null: false
    t.varchar "PayGroupName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailPayrollDetails", primary_key: ["CompanyId", "Id"], force: :cascade do |t|
    t.integer "AuditTrailPayrollId", null: false
    t.integer "CompanyId", null: false
    t.varchar "FieldName", limit: 150
    t.integer "Id", null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailPayrollPeriodDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailPayrollPeriodId", null: false
    t.varchar "FieldName", limit: 50
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailPayrollPeriods", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "PayrollPeriodId", null: false
    t.varchar "PayrollPeriodName", limit: 500
    t.varchar "PayrollPeriodOrder", limit: 500
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailPayrolls", primary_key: ["CompanyId", "ID"], force: :cascade do |t|
    t.integer "CompanyId", null: false
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeId"
    t.integer "ID", null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "PayYear"
    t.integer "PayrollId", null: false
    t.varchar "PayrollNumber", limit: 50
    t.integer "PayrollTypeId"
    t.integer "SecurityUserId"
    t.index ["CompanyId", "LineNo"], name: "IX_tblAuditTrailPayrolls_CompanyId_LineNo"
  end

  create_table "tblAuditTrailPhilHealth", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "PhilHealthBracket"
    t.integer "PhilHealthId", null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailPhilHealthDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailPhilHealthId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailPlugInEvents", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),(0)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "PlugInEventsId"
    t.varchar "PlugInEventsName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailPlugInEventsDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailPlugInEventId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailPositionDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailPositionId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailPositions", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "PositionCode", limit: 50
    t.integer "PositionId", null: false
    t.varchar "PositionName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailPreferences", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true
    t.integer "CompanyId"
    t.varchar "Module", limit: 100
    t.varchar "Remarks", limit: 250
    t.varchar "TableName", limit: 50
    t.integer "VersionNo"
  end

  create_table "tblAuditTrailRDO", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "RDOCode", limit: 50
    t.integer "RDOId", null: false
    t.varchar "RDOName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailRDODetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailRDOId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailReasonForSeparation", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "ReasonForSeparationCode", limit: 50
    t.integer "ReasonForSeparationId", null: false
    t.varchar "ReasonForSeparationName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailReasonForSeparationDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailReasonForSeparationId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailRegionDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailRegionId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailRegions", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "RegionCode", limit: 50
    t.integer "RegionId", null: false
    t.varchar "RegionName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailReimbursementDetails", primary_key: ["CompanyId", "Id"], force: :cascade do |t|
    t.integer "AuditTrailReimbursementId", null: false
    t.integer "CompanyId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.integer "Id", null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailReimbursements", primary_key: ["CompanyId", "Id"], force: :cascade do |t|
    t.integer "CompanyId", null: false
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeId"
    t.integer "FilingStatusId", default: 1
    t.integer "Id", null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "Number", limit: 50
    t.integer "PayElementId"
    t.integer "PayrollId"
    t.integer "ReimbursementId", null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailRequestToHRFiling", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.datetime "CreationDate", precision: nil
    t.datetime "Date", precision: nil
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeId"
    t.integer "LineNo"
    t.string "Mode", limit: 100, null: false
    t.string "Number", limit: 50
    t.integer "RequestToHRFilingId"
    t.string "RequestType", limit: 100
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailRequestToHRFilingDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailRequestToHRFilingId"
    t.string "FieldName", limit: 100
    t.string "NewValue", limit: 1000
    t.string "OldValue", limit: 1000
  end

  create_table "tblAuditTrailSSS", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SSSBracket"
    t.integer "SSSId", null: false
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailSSSDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailSSSId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailSecurityUserGroupDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailSecurityUserGroupId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailSecurityUserGroups", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserGroupId", null: false
    t.varchar "SecurityUserGroupName", limit: 50
    t.integer "SecurityUserId"
  end

  create_table "tblAuditTrailSecurityUserLevelDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailSecurityUserLevelId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailSecurityUserLevels", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.integer "SecurityUserLevelId", null: false
    t.varchar "SecurityUserLevelName", limit: 50
  end

  create_table "tblAuditTrailShiftScheduleDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailShiftScheduleId", null: false
    t.varchar "FieldName", limit: 100
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailShiftScheduleTemplateDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailShiftScheduleTemplateId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailShiftScheduleTemplateGroupDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailShiftScheduleTemplateGroupId", null: false
    t.varchar "FieldName", limit: 256, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailShiftScheduleTemplateGroups", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", null: false
    t.varchar "Code", limit: 50, null: false
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateEffective", precision: nil
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "Name", limit: 50, null: false
    t.varchar "Remarks", limit: 800
    t.integer "SecurityUserId"
    t.integer "ShiftScheduleTemplateGroupId", null: false
  end

  create_table "tblAuditTrailShiftScheduleTemplates", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.integer "ShiftScheduleTemplateId"
    t.varchar "ShiftScheduleTemplateName", limit: 50
  end

  create_table "tblAuditTrailShiftSchedules", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.integer "ShiftScheduleId", null: false
    t.varchar "ShiftScheduleName", limit: 50
  end

  create_table "tblAuditTrailTaxTable", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.integer "TaxTableBracket"
    t.integer "TaxTableId", null: false
  end

  create_table "tblAuditTrailTaxTableDetailed", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "PFId", null: false
    t.integer "SecurityUserId"
    t.integer "TaxCodeId"
    t.integer "TaxTableDetailedId", null: false
  end

  create_table "tblAuditTrailTaxTableDetailedDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailTaxTableDetailedId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailTaxTableDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailTaxTableId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldVAlue", limit: 500
  end

  create_table "tblAuditTrailTeamDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailTeamId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailTeams", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.varchar "TeamCode", limit: 50
    t.integer "TeamId", null: false
    t.varchar "TeamName", limit: 50
  end

  create_table "tblAuditTrailTimeAdjustment", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.varchar "Number", limit: 50
    t.integer "SecurityUserId"
    t.integer "TimeAdjustmentId", null: false
  end

  create_table "tblAuditTrailTimeAdjustmentDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailTimeAdjustmentId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailTimeLog", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeId", default: 0, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.varchar "TimeLog", limit: 50
    t.integer "TimeLogSourceId"
    t.integer "TimelogId", default: 0, null: false
    t.index ["CompanyId", "LineNo"], name: "UX_tblAuditTrailTimeLog_CompanyId_LineNo", unique: true
  end

  create_table "tblAuditTrailTimeLogDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailTimeLogId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailTimeLogFiling", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeId"
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.varchar "TimeLog", limit: 50
    t.varchar "TimeLogFilingNumber", limit: 50
    t.integer "TimelogId"
    t.index ["CompanyId"], name: "IX_tblAuditTrailTimeLogFiling_CompanyId", include: ["LineNo"]
  end

  create_table "tblAuditTrailTimeLogFilingDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailTimeLogFilingId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailTimeSummary", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(convert(datetime,convert(varchar,[DateTime],101)))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.integer "TimeSummaryId", null: false
    t.index ["CompanyId", "LineNo"], name: "IX_tblAuditTrailTimeSummary_CompanyId_LineNo"
  end

  create_table "tblAuditTrailTimeSummaryDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailTimeSummaryId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuditTrailTimesheet", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "Action", limit: 50, null: false
    t.integer "CompanyId"
    t.datetime "Date", precision: nil, null: false
    t.integer "EmployeeId"
    t.datetime "FromDate", precision: nil, null: false
    t.integer "SecurityUserId", null: false
    t.datetime "ToDate", precision: nil, null: false
  end

  create_table "tblAuditTrailUndertimeFiling", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.integer "CompanyId"
    t.virtual "Date", precision: nil, as: "(CONVERT([datetime],CONVERT([varchar],[DateTime],(101)),0))", stored: false
    t.datetime "DateTime", precision: nil, null: false
    t.integer "EmployeeId"
    t.integer "LineNo"
    t.varchar "Mode", limit: 50, null: false
    t.integer "SecurityUserId"
    t.varchar "Undertime", limit: 50
    t.integer "UndertimeFilingId"
    t.varchar "UndertimeFilingNumber", limit: 50
  end

  create_table "tblAuditTrailUndertimeFilingDetails", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AuditTrailUndertimeFilingId", null: false
    t.varchar "FieldName", limit: 50, null: false
    t.varchar "NewValue", limit: 500
    t.varchar "OldValue", limit: 500
  end

  create_table "tblAuthenticationCodes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "AuthenticationCodeHash", limit: 500, null: false
    t.datetime "ExpirationDate", precision: nil
    t.datetime "RequestDate", precision: nil
    t.integer "SecurityUserId", null: false
  end

  create_table "tblBIR2305Settings", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CompanyId", null: false
    t.boolean "IsReplaceBlankMiddleNameWithSpace", default: false, null: false
    t.boolean "IsReplaceNameDashWithNull", default: false, null: false
    t.boolean "IsReplaceNameEnyeWithN", default: false, null: false
    t.varchar "UserName", limit: 200
  end

  create_table "tblBankAccountPayrollPeriodPayCodes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "BankAccountId", null: false
    t.integer "PayCode", null: false
    t.integer "PayrollPeriodId", null: false
    t.integer "TypeOfRunId"
    t.index ["BankAccountId", "PayrollPeriodId"], name: "IX_tblBankAccountPayrollPeriodPayCodes_BankAccountId_PayrollPeriodId"
  end

  create_table "tblBankAccountTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "Name", limit: 50, null: false
  end

  create_table "tblBankAccounts", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "AccountCode", limit: 50
    t.varchar "AccountNo", limit: 50
    t.varchar "AccountTitle", limit: 50
    t.varchar "Address", limit: 250
    t.varchar "AlternateTransactionType", limit: 100
    t.varchar "AuthorizationType", limit: 1
    t.varchar "BankCode", limit: 50
    t.varchar "BankCompanyEFTKey", limit: 100
    t.varchar "BankCompanyId", limit: 100
    t.integer "BankId"
    t.varchar "BatchReference", limit: 35
    t.varchar "BicSwift", limit: 150
    t.varchar "BranchCode", limit: 50
    t.varchar "BranchName", limit: 250
    t.money "CeilingAmount", precision: 19, scale: 4, default: 0.0, null: false
    t.integer "CompanyId", default: 0, null: false
    t.varchar "ContactPerson", limit: 50
    t.varchar "ContactPersonPos", limit: 50, default: ""
    t.integer "CurrencyId"
    t.varchar "HSBCBRSTN", limit: 50
    t.varchar "HSBCCBID", limit: 50
    t.varchar "HSBCCNETCustomerId", limit: 50
    t.varchar "HSBCConnectCustomerId", limit: 50
    t.varchar "HSBCGroup", limit: 50
    t.varchar "HSBCSwift", limit: 50
    t.varchar "IBan", limit: 150
    t.boolean "IncludeHeader", default: true, null: false
    t.boolean "IncludeTrailer", default: true, null: false
    t.boolean "IsAdviceIndicator", default: false, null: false
    t.boolean "IsUseAccountNumberDepBranchCode", default: false, null: false
    t.boolean "IsWHTIndicator", default: false, null: false
    t.varchar "Name", limit: 50, null: false
    t.varchar "ReceivingBankCityName", limit: 100
    t.varchar "ReceivingBankIdSortCode", limit: 100
    t.varchar "ReceivingBankName", limit: 100
    t.varchar "TransactionType", limit: 100
    t.varchar "UnionBankAccountChannel", limit: 50
    t.varchar "UnionBankAccountOurSha", limit: 50
    t.varchar "UnionBankAccountPurpose", limit: 50
    t.integer "VersionNo", default: 1, null: false
  end

  create_table "tblBankAllocationTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "Name", limit: 50, null: false
  end

  create_table "tblBankTransmittalDisketteExtensions", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "DefaultExt", limit: 500
    t.varchar "FileName", limit: 500
    t.varchar "Filter", limit: 500
    t.varchar "Name", limit: 500, null: false
    t.varchar "SysCode", limit: 100, null: false
  end

  create_table "tblBankTransmittalStatus", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "Name", limit: 50, null: false
  end

  create_table "tblBanks", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "AccountNoLabel", limit: 100
    t.boolean "Active", default: true, null: false
    t.varchar "BankCodeLabel", limit: 100
    t.varchar "BranchCodeLabel", limit: 100
    t.varchar "BranchNameLabel", limit: 250
    t.varchar "CeilingLabel", limit: 50
    t.boolean "DisableCarriageReturn", default: false, null: false
    t.varchar "FileOutputType", limit: 50
    t.boolean "IsShowPayrollPeriodPayCode", default: false
    t.boolean "IsUseAccountNumberDepBranchCode", default: false, null: false
    t.string "Logo"
    t.varchar "Name", limit: 100, null: false
    t.varchar "Remarks", limit: 500
    t.varchar "SysCode", limit: 50, null: false
    t.index ["SysCode"], name: "UX_tblBanks_SysCode", unique: true
  end

  create_table "tblBloodTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Code", limit: 50
  end

  create_table "tblBreakScheduleTypes", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Name", limit: 50, null: false
  end

  create_table "tblBreakSchedules", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.float "AllottedMinutes", null: false
    t.integer "BreakScheduleTypeId", null: false
    t.virtual "CalcEndTime", precision: nil, as: "(case when ([StartTime] > [EndTime]) then (dateadd(day,1,[EndTime])) else [EndTime] end)", stored: false
    t.virtual "CalcEndTimeDiff", null: false, as: "(case when ([StartTime] > [EndTime]) then 1 else 0 end)", stored: false
    t.integer "DailyScheduleId", null: false
    t.datetime "EndTime", precision: nil
    t.float "MinimumHoursWorked", default: 0.0, null: false
    t.varchar "Remarks", limit: 50
    t.float "RoundUpTardy", default: 0.0, null: false
    t.datetime "StartTime", precision: nil
    t.float "TardyGracePeriod", default: 0.0, null: false
  end

  create_table "tblCalendarMethodOffsettings", primary_key: ["CompanyId", "EmployeeId", "Date", "DateEffective"], force: :cascade do |t|
    t.integer "CompanyId", null: false
    t.float "CreditedND"
    t.float "CreditedNDOT"
    t.float "CreditedNDOTExcess"
    t.float "CreditedOT"
    t.float "CreditedOTExcess"
    t.float "CreditedRegHours"
    t.datetime "Date", precision: nil, null: false
    t.datetime "DateEffective", precision: nil, null: false
    t.integer "DayTypeId", null: false
    t.integer "EffectiveDayTypeId", null: false
    t.integer "EmployeeId", null: false
    t.integer "OriginalEffectiveDayTypeId", null: false
    t.check_constraint "[CompanyId]>=(0)", name: "CK_tblCalendarMethodOffsettings_CompanyId"
  end

  create_table "tblCertificateTemplates", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active"
    t.varchar "Code", limit: 50
    t.integer "CompanyId"
    t.ntext "DeductionsData"
    t.ntext "EarningsData"
    t.ntext "Footer"
    t.ntext "Header"
    t.boolean "IsShowLogo"
    t.ntext "LowerBody"
    t.varchar "Name", limit: 100
    t.ntext "Remarks"
    t.varchar "SysCode", limit: 50
    t.integer "Type"
    t.ntext "UpperBody"
  end

  create_table "tblChangeDailySchedules", primary_key: ["CompanyId", "Id"], force: :cascade do |t|
    t.datetime "ActualTimeIn", precision: nil
    t.datetime "ActualTimeOut", precision: nil
    t.datetime "ApprovalDate", precision: nil
    t.virtual "Approved", as: "(convert(bit,case when ([FilingStatusId] = 2) then 1 else 0 end))", stored: false
    t.integer "ApprovedById"
    t.varchar "ApproverRemarks", limit: 1000
    t.integer "CompanyId", default: 0, null: false
    t.integer "CreatedById"
    t.datetime "CreationDate", precision: nil
    t.datetime "Date", precision: nil, null: false
    t.integer "EmployeeId", null: false
    t.integer "FilingStatusId", default: 1
    t.integer "Id", null: false
    t.boolean "IsFromMonthlyShiftSchedule"
    t.datetime "ModificationDate", precision: nil
    t.boolean "Modified"
    t.integer "ModifiedById"
    t.integer "NewDailyScheduleId"
    t.integer "NewDayTypeId"
    t.integer "NextSequenceNo", default: 1, null: false
    t.integer "OldDailyScheduleId"
    t.integer "OldDayTypeId"
    t.boolean "Posted", default: false
    t.varchar "Remarks", limit: 250
    t.integer "SuggestedDailyScheduleId"
    t.integer "UIID"
    t.integer "VersionNo", default: 1, null: false
    t.varchar "WeekDay", limit: 10
    t.index ["CompanyId", "EmployeeId", "Date"], name: "IX_tblChangeDailySchedules_CompanyId_EmployeeId_Date", unique: true, include: ["FilingStatusId", "NewDailyScheduleId", "NewDayTypeId"]
    t.index ["Id"], name: "IX_tblChangeDailySchedules_Id"
  end

  create_table "tblChangeShiftScheduleTemplateFiling", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ApprovedById"
    t.integer "CompanyId", null: false
    t.integer "CreatedById"
    t.datetime "CreationDate", precision: nil
    t.integer "EmployeeId", null: false
    t.integer "FilingStatusId", default: 1, null: false
    t.datetime "FromDate", precision: nil, null: false
    t.datetime "ModificationDate", precision: nil
    t.integer "ModifiedById"
    t.integer "NextSequenceNo", default: 1, null: false
    t.varchar "Remarks", limit: 500
    t.integer "ShiftScheduleId", null: false
    t.datetime "ToDate", precision: nil, null: false
    t.index ["CompanyId", "EmployeeId"], name: "IX_tblChangeShiftScheduleTemplateFiling_CompanyId_EmployeeId"
  end

  create_table "tblCitizenship", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Code", limit: 50, null: false
    t.integer "CompanyId"
    t.varchar "Name", limit: 50, null: false
    t.integer "VersionNo", default: 1, null: false
  end

  create_table "tblClasses", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Code", limit: 50, null: false
    t.integer "CompanyId", default: 0, null: false
    t.varchar "Name", limit: 50, null: false
    t.integer "VersionNo", default: 1, null: false
  end

  create_table "tblClearanceStatus", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.varchar "Code", limit: 50, null: false
    t.integer "CompanyId", null: false
    t.varchar "Name", limit: 200, null: false
    t.integer "VersionNo", default: 1, null: false
  end

  create_table "tblClients", primary_key: ["Id", "Name"], force: :cascade do |t|
    t.boolean "Active", default: true, null: false
    t.integer "CompanyId", default: 0, null: false
    t.integer "Id", null: false
    t.boolean "IsRequireInOut", default: true, null: false
    t.varchar "Name", limit: 50, null: false
    t.integer "VersionNo", default: 1, null: false
  end

  create_table "tblCompanies", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "AllowLeaveHoursToExceedBasicHours", default: false, null: false
    t.boolean "AutoReprocessPayroll", default: true, null: false
    t.varchar "BIR1902Position", limit: 50
    t.varchar "BIR1902SignName", limit: 100
    t.string "BIR1902Signature"
    t.varchar "BIR2316Position", limit: 100
    t.varchar "BIR2316Position2", limit: 100
    t.varchar "BIR2316SignName", limit: 100
    t.varchar "BIR2316SignName2", limit: 100
    t.string "BIR2316Signature"
    t.string "BIR2316Signature2"
    t.varchar "BIROthersPosition", limit: 100
    t.varchar "BIROthersSignName", limit: 100
    t.string "BIROthersSignature"
    t.varchar "BIRRemittancePosition", limit: 100
    t.varchar "BIRRemittanceSignName", limit: 100
    t.string "BIRRemittanceSignature"
    t.varchar "BIRRemittanceTIN", limit: 50
    t.varchar "BIRRemittanceTreasurerPosition", limit: 100
    t.varchar "BIRRemittanceTreasurerSignName", limit: 100
    t.string "BIRRemittanceTreasurerSignature"
    t.varchar "BIRRemittanceTreasurerTIN", limit: 50
    t.varchar "BankAdviceSignName", limit: 50
    t.varchar "BankAdviceSignName2", limit: 50
    t.varchar "BankAdviceSignPos1", limit: 50
    t.varchar "BankAdviceSignPos2", limit: 50
    t.string "BankAdviceSignature1"
    t.string "BankAdviceSignature2"
    t.varchar "BankApprovedBy1", limit: 50
    t.varchar "BankApprovedBy2", limit: 50
    t.varchar "BankApprovedBy3", limit: 50
    t.float "BenchMarkInterestRate", default: 12.0, null: false
    t.varchar "CertificateContactNumber", limit: 500
    t.varchar "CertificateEmailAddress", limit: 500
    t.varchar "CertificatePosition", limit: 50
    t.varchar "CertificateSignName", limit: 50
    t.string "CertificateSignature"
    t.varchar "Code", limit: 250
    t.virtual "CompanyId", null: false, as: "([Id])", stored: false
    t.integer "CompanyTypeId", default: 1
    t.varchar "ContactNo", limit: 50
    t.string "CustomBPOIHRHeadSignature"
    t.string "CustomBPOIPayrollSpecialistSignature"
    t.varchar "CustomCheckbox1Caption", limit: 50
    t.varchar "CustomCheckbox2Caption", limit: 50
    t.varchar "CustomCheckbox3Caption", limit: 50
    t.varchar "CustomCheckbox4Caption", limit: 50
    t.varchar "CustomCheckbox5Caption", limit: 50
    t.varchar "CustomCheckbox6Caption", limit: 50
    t.varchar "CustomCheckbox7Caption", limit: 50
    t.varchar "CustomCheckbox8Caption", limit: 50
    t.varchar "CustomDateField1Caption", limit: 50
    t.varchar "CustomDateField2Caption", limit: 50
    t.varchar "CustomDateField3Caption", limit: 50
    t.varchar "CustomDateField4Caption", limit: 50
    t.varchar "CustomDateField5Caption", limit: 50
    t.varchar "CustomDateField6Caption", limit: 50
    t.varchar "CustomDateField7Caption", limit: 50
    t.varchar "CustomDateField8Caption", limit: 50
    t.varchar "CustomField1Caption", limit: 50, default: "Custom1", null: false
    t.varchar "CustomField2Caption", limit: 50, default: "Custom2", null: false
    t.varchar "CustomField3Caption", limit: 50, default: "Custom3", null: false
    t.varchar "CustomField4Caption", limit: 50
    t.varchar "CustomField5Caption", limit: 50
    t.varchar "CustomField6Caption", limit: 50
    t.varchar "CustomField7Caption", limit: 50
    t.varchar "CustomField8Caption", limit: 50
    t.varchar "CustomGroup1Caption", limit: 50, default: "Custom Group1", null: false
    t.varchar "CustomGroup2Caption", limit: 50, default: "Custom Group2", null: false
    t.varchar "CustomGroup3Caption", limit: 50, default: "Custom Group3", null: false
    t.varchar "CustomGroup4Caption", limit: 50
    t.varchar "CustomGroup5Caption", limit: 50
    t.varchar "CustomGroup6Caption", limit: 50
    t.varchar "CustomGroup7Caption", limit: 50
    t.varchar "CustomGroup8Caption", limit: 50
    t.varchar "CustomISSPreparedBy", limit: 500
    t.string "CustomISSPreparedBySignature"
    t.varchar "DBREmailAddress", limit: 250
    t.varchar "DBRName", limit: 250
    t.integer "DefaultTimeSourceId", default: 1, null: false
    t.integer "DisputeTypeFieldsLimit", default: 7, null: false
    t.varchar "Email", limit: 50
    t.boolean "EmployeeShouldBeRegularOnLeaveCredit", default: false, null: false
    t.boolean "EnableClass", default: true, null: false
    t.varchar "FaxNo", limit: 50
    t.varchar "FinalPayApproverSignName1", limit: 250
    t.varchar "FinalPayApproverSignName2", limit: 250
    t.varchar "FinalPayApproverSignPosition1", limit: 250
    t.varchar "FinalPayApproverSignPosition2", limit: 250
    t.string "FinalPayApproverSignature1"
    t.string "FinalPayApproverSignature2"
    t.varchar "FinalPayCounterCheckerSignName", limit: 250
    t.varchar "FinalPayCounterCheckerSignPosition", limit: 255
    t.string "FinalPayCounterCheckerSignature"
    t.varchar "HDMFBranchCode", limit: 50
    t.varchar "HDMFNo", limit: 50
    t.varchar "HDMFSignName", limit: 50
    t.varchar "HDMFSignPosition", limit: 50
    t.string "HDMFSignature"
    t.varchar "HRHeadName", limit: 500
    t.varchar "HRHeadPosition", limit: 500
    t.string "HRHeadSignature"
    t.integer "HierarchyApprovalLevel", default: 1, null: false
    t.boolean "IncludeBTHeader", default: true, null: false
    t.boolean "IsANDLogicApproval", default: false, null: false
    t.boolean "IsAbsentIncludesLeave", default: false, null: false
    t.boolean "IsAllowInsertingStandardPayElement", default: false, null: false
    t.boolean "IsAllowModificationOfLeaveAdjustment", default: false, null: false
    t.boolean "IsAllowModificationOfLeaveForfeiture", default: false, null: false
    t.boolean "IsAllowOTwithoutBASIC", default: false, null: false
    t.boolean "IsAllowOffsettingOfStatutoryDeduction", default: true, null: false
    t.boolean "IsApplyPunishmentOnPaidLeave", default: false, null: false
    t.boolean "IsApprovalByHierarchy", default: false, null: false
    t.boolean "IsAutoGenerateEmployeeCode", default: false, null: false
    t.boolean "IsComputeAnnualizeTaxDueFromPreviousEmployer", default: false, null: false
    t.boolean "IsComputeHrsOfNonRegularDayBasedOnTimesheetForDailyPaid", default: false, null: false
    t.boolean "IsComputeMidbreakOnNonRegularDays", default: false, null: false
    t.boolean "IsComputeMultiRateForFormulatedPayElements", default: false, null: false
    t.boolean "IsComputeRegBasicMonthlyPaidHolidaySplit", default: true, null: false
    t.boolean "IsComputeTardyOnNonRegularDays", default: false, null: false
    t.boolean "IsComputeUndertimeOnNonRegularDays", default: false, null: false
    t.boolean "IsConsider13thMonthTaxFreeBonusOnDeminimisExcessAmount"
    t.boolean "IsConsiderNegativeEarningsInMinTakeHomePay", default: false, null: false
    t.boolean "IsConsiderNonTaxableInFinalTax", default: true, null: false
    t.boolean "IsDisableESSVersionCheck", default: false, null: false
    t.boolean "IsDisplayInvalidShiftOnRemarks", default: true, null: false
    t.boolean "IsEnableAdditionalPayoutType", default: false, null: false
    t.boolean "IsEnableAdvancedBankAccount", default: false, null: false
    t.boolean "IsEnableAllowance", default: false
    t.boolean "IsEnableAllowanceAdjustment", default: true, null: false
    t.boolean "IsEnableAutoApprovalOf201FilingOnScheduledEffectivityDate", default: false, null: false
    t.boolean "IsEnableBaseAmount", default: false, null: false
    t.boolean "IsEnableCOLA", default: true, null: false
    t.boolean "IsEnableCappingOnLoan", default: false, null: false
    t.boolean "IsEnableConvertToLeave", default: true, null: false
    t.boolean "IsEnableCurrency", default: false, null: false
    t.boolean "IsEnableCustomFilenameExport", default: false, null: false
    t.boolean "IsEnableCustomizedLoginLogo", default: false, null: false
    t.boolean "IsEnableDateEffective", default: false, null: false
    t.boolean "IsEnableDayTypeSplitOnCalendarMethod", default: false, null: false
    t.boolean "IsEnableDefaultDTRProject", default: false, null: false
    t.boolean "IsEnableDeferPayAdjustment", default: false, null: false
    t.boolean "IsEnableDiminishingLoan", default: false, null: false
    t.integer "IsEnableESS", default: 0, null: false
    t.boolean "IsEnableEditOnPreviousDatesOnDailyShiftRegister", default: false, null: false
    t.boolean "IsEnableEditOnTimeSheet", default: true, null: false
    t.boolean "IsEnableEmployeeCodeValidationFromOtherCompany", default: false, null: false
    t.boolean "IsEnableFILO", default: false, null: false
    t.boolean "IsEnableGrossUp", default: false, null: false
    t.boolean "IsEnableGrossUpPerPayroll", default: false, null: false
    t.boolean "IsEnableHalfDayFilingComputationInTimesheet", default: false, null: false
    t.boolean "IsEnableHolidaySplit", default: false, null: false
    t.boolean "IsEnableJSM", default: false, null: false
    t.boolean "IsEnableLeaveApprovalOnNonRegularDay", default: false, null: false
    t.boolean "IsEnableLoadRecordsButton", default: false, null: false
    t.boolean "IsEnableLoanInterestForegone", default: false, null: false
    t.boolean "IsEnableLocation", default: false, null: false
    t.boolean "IsEnableMasterFileLocking", default: false, null: false
    t.boolean "IsEnableMinimumNetPay", default: true, null: false
    t.boolean "IsEnableMinimumOT", default: false, null: false
    t.boolean "IsEnableMultiRate", default: false, null: false
    t.boolean "IsEnableNormalizeTax", default: false, null: false
    t.boolean "IsEnableOTPonESS", default: false
    t.boolean "IsEnablePayrollVariancePayElement", default: false, null: false
    t.boolean "IsEnablePendingPayAdjustment", default: false, null: false
    t.boolean "IsEnablePositionInDTR", default: false
    t.boolean "IsEnableProcessedTimesheetReport", default: true, null: false
    t.boolean "IsEnableProjectInDTR", default: false
    t.boolean "IsEnableProjectTaxableEarningsInNormalizeTaxOption", default: false, null: false
    t.boolean "IsEnableRegionInDTR", default: false
    t.boolean "IsEnableReimbursementFiling", default: false, null: false
    t.boolean "IsEnableRestDayShift", default: false, null: false
    t.boolean "IsEnableRestDaySplit", default: false, null: false
    t.boolean "IsEnableRetroActivePay", default: false, null: false
    t.boolean "IsEnableRoundDownOT", default: false, null: false
    t.boolean "IsEnableStartDay", default: false, null: false
    t.boolean "IsEnableTaxPaidByEmployer", default: false, null: false
    t.boolean "IsEnableTimeSummaryBasicDaysEncoding", default: false, null: false
    t.boolean "IsForceComputeHolidayPay", default: false, null: false
    t.boolean "IsForceTaxDueAndWithheldEqual", default: false, null: false
    t.boolean "IsIgnoreZeroWhenImportPayAdjustment", default: false, null: false
    t.boolean "IsIgnoreZeroWhenImportTimeSummary", default: false, null: false
    t.boolean "IsImportOnPackageInstaller", default: false, null: false
    t.boolean "IsIncludeTaxableExemptOnNonTaxableBasicSalaryOnBIR2316", default: false, null: false
    t.boolean "IsLoanInterestForegoneSchedulePerYear", default: true, null: false
    t.boolean "IsMerge13thMonthPayAndDeMinimis", default: false, null: false
    t.boolean "IsNumericAccessCode", default: false, null: false
    t.boolean "IsORLogicApproval", default: true, null: false
    t.boolean "IsOffsetNDOTtoND", default: false, null: false
    t.boolean "IsPremiumOnlyOnND", default: true, null: false
    t.boolean "IsPrioritizeCreditedLeave", default: false, null: false
    t.boolean "IsPrioritizeCustomDTRInTimesheetComputation", default: false, null: false
    t.boolean "IsPrioritizeMWEOnAlphalist", default: true, null: false
    t.boolean "IsPrioritizeTardyHalfDayOverIsOffsetToTardy", default: false, null: false
    t.boolean "IsPriorityDeductionScheduleInPayElementFormula", default: true, null: false
    t.boolean "IsPromptBackupReminderOnServer", default: false, null: false
    t.boolean "IsPromptBackupReminderOnWorkstation", default: false, null: false
    t.boolean "IsPromptLockPayroll", default: true, null: false
    t.boolean "IsRecallRecurringPayElementsInRetro", default: false, null: false
    t.boolean "IsRecallZeroAllowanceInRetro", default: true, null: false
    t.boolean "IsRecallZeroCOLAInRetro", default: true, null: false
    t.boolean "IsRecallZeroParameterRateInRetro", default: true, null: false
    t.boolean "IsReflectTaxRefundOnDecember", default: false, null: false
    t.boolean "IsRemoveSalaryInfo", default: false
    t.boolean "IsRequireDateHired", default: false, null: false
    t.boolean "IsRequireGovernmentNoIn201", default: false, null: false
    t.boolean "IsRequiredDateHired", default: false, null: false
    t.boolean "IsRequiresOrderedApproval", default: false, null: false
    t.boolean "IsSaveLocationOnEssBundy", default: false, null: false
    t.boolean "IsSaveSecondsOnDTR", default: true, null: false
    t.boolean "IsShowDaysInYearPerEmployee", default: false, null: false
    t.boolean "IsShowHeaderInExport", default: true, null: false
    t.boolean "IsShowInLogIn", default: true, null: false
    t.boolean "IsShowLeaveConversionFiling", default: false, null: false
    t.boolean "IsShowLoanLedger", default: false, null: false
    t.boolean "IsShowOldBIRReports", default: false, null: false
    t.boolean "IsStrictHalfDay", default: true, null: false
    t.boolean "IsTaxableFirst13thMonthPayPayElements", default: false, null: false
    t.boolean "IsUpdateTimesheetOnFiling", default: false, null: false
    t.boolean "IsUpdateTimesheetOnHolidayChange", default: false, null: false
    t.boolean "IsUse48Hours", default: false, null: false
    t.boolean "IsUseAdvancedPayAdjustment", default: false, null: false
    t.boolean "IsUseAdvancedShiftSchedule", default: false, null: false
    t.boolean "IsUseDetailedPayrollVariancePayElement", default: false, null: false
    t.boolean "IsUseEssAdvancedPayslip", default: false
    t.boolean "IsValidateContractDate", default: true, null: false
    t.varchar "LineOfBusiness", limit: 150
    t.varchar "LoanRefNoCaption", limit: 50, default: "Ref No", null: false
    t.varchar "LoginImagePath", limit: 250
    t.string "Logo"
    t.integer "MaximumAttachmentFileSizeMB", default: 50, null: false
    t.varchar "MedicalReportPosition", limit: 50
    t.varchar "MedicalReportSignName", limit: 50
    t.string "MedicalReportSignature"
    t.varchar "Name", limit: 250
    t.integer "NewPHICYearEffective"
    t.varchar "NonTaxable13thMonthCaption", limit: 50, default: "Non-Taxable", null: false
    t.varchar "OAUTHAuthorizationCode", limit: 100
    t.varchar "OAuthAccessToken", limit: 250
    t.varchar "OAuthClientId", limit: 250
    t.boolean "OAuthLogin", default: false, null: false
    t.varchar "OAuthRedirectURL", limit: 250
    t.varchar "OAuthRefreshToken", limit: 250
    t.varchar "OAuthSecretKey", limit: 250
    t.varchar "OAuthTenantId", limit: 250
    t.boolean "OTWithoutBasicIsPresent", default: false, null: false
    t.integer "OfficeTypeId", default: 1, null: false
    t.integer "OptimizationMessageId", default: 1, null: false
    t.varchar "OtherSignName", limit: 50
    t.varchar "OtherSignPos", limit: 50
    t.string "OtherSignature"
    t.varchar "OtherSupplementary1Caption", limit: 50, default: "Overtime"
    t.varchar "OtherSupplementary2Caption", limit: 50, default: "Holiday Pay"
    t.varchar "OtherTaxable1Caption", limit: 50
    t.varchar "OtherTaxable2Caption", limit: 50
    t.varchar "PHICBranchCode", limit: 50
    t.varchar "PHICNo", limit: 50
    t.varchar "PHICSignName", limit: 50
    t.varchar "PHICSignPosition", limit: 50
    t.string "PHICSignature"
    t.integer "ParentId"
    t.boolean "PasswordComplexity", default: false, null: false
    t.integer "PasswordHistory", default: 0, null: false
    t.integer "PasswordMaxAge", default: 30, null: false
    t.integer "PasswordMinAge", default: 0, null: false
    t.integer "PasswordMinLength", default: 0, null: false
    t.integer "PasswordWarnDays", default: 7, null: false
    t.boolean "PayrollAutoLock", default: true, null: false
    t.varchar "PayrollRegisterSignName1", limit: 200
    t.varchar "PayrollRegisterSignName2", limit: 200
    t.varchar "PayrollRegisterSignPosition1", limit: 100
    t.varchar "PayrollRegisterSignPosition2", limit: 100
    t.varchar "PayrollSpecialistName", limit: 500
    t.varchar "PayrollSpecialistPosition", limit: 500
    t.string "PayrollSpecialistSignature"
    t.integer "PayslipId", default: 1, null: false
    t.integer "PayslipLogoLocationId", default: 3, null: false
    t.integer "PayslipNameId", default: 1, null: false
    t.varchar "PayslipSignName", limit: 50
    t.varchar "PayslipSignPosition", limit: 50
    t.string "PayslipSignature"
    t.varchar "PayslipSubheader", limit: 100
    t.boolean "PromptBackupNewPayroll", default: false, null: false
    t.boolean "PromptDuplicatePayrollPeriod", default: false, null: false
    t.varchar "RDOCode", limit: 50
    t.integer "RateDecimalPlaces", default: 2, null: false
    t.virtual "RegisteredAddress", limit: 2500, as: "([dbo].[fnComputeCompanyAddress]([Id]))", stored: false
    t.varchar "RegisteredName", limit: 250
    t.boolean "ResetPayrollOnReprocess", default: true, null: false
    t.varchar "SAPAcctRegion", limit: 50
    t.varchar "SAPDivision", limit: 50
    t.varchar "SAPRecordType", limit: 50
    t.varchar "SAPVoucherCurrency", limit: 50
    t.varchar "SAPVoucherOrigin", limit: 50
    t.varchar "SAPVoucherType", limit: 50
    t.integer "SMTPAuthenticationTypeId", default: 1, null: false
    t.varchar "SMTPCCAddress", limit: 150
    t.varchar "SMTPCCName", limit: 50
    t.boolean "SMTPForcePort", default: false, null: false
    t.varchar "SMTPHost", limit: 50
    t.boolean "SMTPLogin", default: false, null: false
    t.varchar_max "SMTPMessage"
    t.varchar "SMTPPassword", limit: 1000
    t.integer "SMTPPort", default: 25, null: false
    t.varchar "SMTPReplyToAddress", limit: 150
    t.integer "SMTPSecuredConnectionTypeId", default: 0
    t.varchar "SMTPSenderAddress", limit: 50
    t.varchar "SMTPSenderName", limit: 50
    t.integer "SMTPServiceId", default: 0, null: false
    t.integer "SMTPTimeout", default: 60, null: false
    t.varchar "SMTPUserName", limit: 50
    t.varchar "SSSBranchCode", limit: 50
    t.varchar "SSSLoanSignName", limit: 50
    t.varchar "SSSLoanSignPosition", limit: 50
    t.string "SSSLoanSignature"
    t.varchar "SSSLocatorCodeId", limit: 50
    t.varchar "SSSMaternitySignName", limit: 50
    t.varchar "SSSMaternitySignPosition", limit: 50
    t.string "SSSMaternitySignature"
    t.varchar "SSSNo", limit: 50
    t.string "SSSSSignature"
    t.varchar "SSSSignName", limit: 50
    t.varchar "SSSSignPosition", limit: 50
    t.varchar "Shibboleth", limit: 300
    t.boolean "ShowOnlySubordinates", default: false, null: false
    t.boolean "ShowTINBranch", default: false, null: false
    t.varchar "TINBranch", limit: 50, default: "0000"
    t.varchar "TINNo", limit: 50
    t.integer "TRAINYear"
    t.varchar "Taxable13thMonthCaption", limit: 50, default: "Taxable", null: false
    t.varchar "TelNo", limit: 50
    t.integer "TimeLogInterval"
    t.integer "TimelogPairInterval", default: 24, null: false
    t.integer "TotalAllotedAttachmentFileSizeMB", default: 1024, null: false
    t.boolean "UpdateTimesheetOnTimeLogUpdate", default: false, null: false
    t.boolean "Use24HourFormat", default: false, null: false
    t.boolean "Use2DecimalPlacesforSalaryCOLAAllowancesOtherRecurring", default: false, null: false
    t.boolean "UseFormalName", default: true, null: false
    t.boolean "UsePredefinedFormat", default: false, null: false
    t.boolean "UseSSSNoOnCTCNo", default: false, null: false
    t.boolean "UseTimeLogHashing", default: false, null: false
    t.integer "VersionNo"
    t.varchar "VirtualRegisteredName", limit: 250
    t.varchar "VirtualSSSNo", limit: 50
    t.varchar "VirtualTINNo", limit: 50
    t.string "WTAXSignature"
    t.varchar "WTaxPosition", limit: 50
    t.varchar "WTaxSignName", limit: 50
    t.varchar "WTaxTIN", limit: 50
    t.float "WarnNetpay", default: 0.0, null: false
    t.integer "WarnNetpayTypeId", default: 2, null: false
    t.boolean "WebJPSPDFReportPasswordProtected", default: true, null: false
    t.varchar "WebSite", limit: 50
    t.varchar "ZipCode", limit: 50
  end

  create_table "tblCompany201RequiredFields", id: false, force: :cascade do |t|
    t.integer "CompanyId", null: false
    t.integer "EmployeeRequiredFieldId", null: false
  end

