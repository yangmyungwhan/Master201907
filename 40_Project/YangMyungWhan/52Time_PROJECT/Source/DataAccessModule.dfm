object dmDataAccess: TdmDataAccess
  OldCreateOrder = False
  Height = 653
  Width = 825
  object con52Time: TFDConnection
    Params.Strings = (
      'ConnectionDef=52TIME_DB_V2')
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 24
  end
  object qry52Time: TFDQuery
    Connection = con52Time
    SQL.Strings = (
      'SELECT *'
      'FROM TB_USERS')
    Left = 104
    Top = 24
  end
  object qryInformationDept: TFDQuery
    Active = True
    OnCalcFields = qryInformationDeptCalcFields
    Connection = con52Time
    SQL.Strings = (
      'SELECT '
      'TB_USERS.*,'
      'TB_DEPARTMENT.DEPT_DEPT'
      ''
      'FROM'
      'TB_USERS, TB_DEPARTMENT'
      ''
      'WHERE'
      'TB_USERS.DEPT_SEQ = TB_DEPARTMENT.DEPT_SEQ')
    Left = 104
    Top = 88
    object qryInformationDeptUSERS_SEQ: TIntegerField
      FieldName = 'USERS_SEQ'
      Origin = 'USERS_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryInformationDeptUSERS_CODE: TIntegerField
      Alignment = taCenter
      FieldName = 'USERS_CODE'
      Origin = 'USERS_CODE'
      Required = True
    end
    object qryInformationDeptUSERS_NAME: TWideStringField
      Alignment = taCenter
      FieldName = 'USERS_NAME'
      Origin = 'USERS_NAME'
      Required = True
      Size = 40
    end
    object qryInformationDeptUSERS_PASS: TWideStringField
      FieldName = 'USERS_PASS'
      Origin = 'USERS_PASS'
      Required = True
      Size = 60
    end
    object qryInformationDeptUSERS_NUM: TWideStringField
      Alignment = taCenter
      FieldName = 'USERS_NUM'
      Origin = 'USERS_NUM'
      Required = True
      Size = 60
    end
    object qryInformationDeptUSERS_IMG: TBlobField
      FieldName = 'USERS_IMG'
      Origin = 'USERS_IMG'
    end
    object qryInformationDeptUSERS_MA: TWideStringField
      FieldName = 'USERS_MA'
      Origin = 'USERS_MA'
      Required = True
      FixedChar = True
      Size = 4
    end
    object qryInformationDeptDEPT_SEQ: TIntegerField
      FieldName = 'DEPT_SEQ'
      Origin = 'DEPT_SEQ'
      Required = True
    end
    object qryInformationDeptDEPT_DEPT: TWideStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'DEPT_DEPT'
      Origin = 'DEPT_DEPT'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryInformationDeptUSERS_MA_OX: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'USERS_MA_OX'
      Calculated = True
    end
  end
  object qryTimeInsert: TFDQuery
    Active = True
    IndexesActive = False
    Connection = con52Time
    UpdateObject = usTimeInsert
    SQL.Strings = (
      'SELECT'
      'TB_WORKTIMEINSERT.*,'
      'TB_USERS.USERS_NAME'
      ''
      'FROM'
      'TB_WORKTIMEINSERT, TB_USERS'
      ''
      'WHERE'
      'TB_WORKTIMEINSERT.USERS_SEQ = TB_USERS.USERS_SEQ')
    Left = 104
    Top = 144
    object qryTimeInsertWTIT_SEQ: TIntegerField
      Alignment = taCenter
      FieldName = 'WTIT_SEQ'
      Origin = 'WTIT_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTimeInsertUSERS_SEQ: TIntegerField
      Alignment = taCenter
      FieldName = 'USERS_SEQ'
      Origin = 'USERS_SEQ'
    end
    object qryTimeInsertWTIT_STWORKTIME: TTimeField
      Alignment = taCenter
      FieldName = 'WTIT_STWORKTIME'
      Origin = 'WTIT_STWORKTIME'
      DisplayFormat = 'hh:mm'
    end
    object qryTimeInsertWTIT_FIWORKTIME: TTimeField
      Alignment = taCenter
      FieldName = 'WTIT_FIWORKTIME'
      Origin = 'WTIT_FIWORKTIME'
      DisplayFormat = 'hh:mm'
    end
    object qryTimeInsertWTIT_STEXCEPTTIME: TTimeField
      Alignment = taCenter
      FieldName = 'WTIT_STEXCEPTTIME'
      Origin = 'WTIT_STEXCEPTTIME'
      DisplayFormat = 'hh:mm'
    end
    object qryTimeInsertWTIT_FIEXCEPTTIME: TTimeField
      Alignment = taCenter
      FieldName = 'WTIT_FIEXCEPTTIME'
      Origin = 'WTIT_FIEXCEPTTIME'
      DisplayFormat = 'hh:mm'
    end
    object qryTimeInsertWTIT_DATE: TSQLTimeStampField
      Alignment = taCenter
      FieldName = 'WTIT_DATE'
      Origin = 'WTIT_DATE'
    end
    object qryTimeInsertUSERS_NAME: TWideStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'USERS_NAME'
      Origin = 'USERS_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
  end
  object qryDept: TFDQuery
    Active = True
    Connection = con52Time
    SQL.Strings = (
      'SELECT *'
      'FROM TB_DEPARTMENT')
    Left = 104
    Top = 312
  end
  object dsInformationDept: TDataSource
    DataSet = qryInformationDept
    Left = 208
    Top = 88
  end
  object dsTimeInsert: TDataSource
    DataSet = qryTimeInsert
    Left = 208
    Top = 144
  end
  object dsDept: TDataSource
    DataSet = qryDept
    Left = 208
    Top = 304
  end
  object qryUpdateTimeInsert: TFDQuery
    Connection = con52Time
    SQL.Strings = (
      'UPDATE TB_WORKTIMEINSERT SET'
      'WTIT_FIWORKTIME = :FIWORKTIME'
      'WHERE WTIT_SEQ = :SEQ')
    Left = 104
    Top = 448
    ParamData = <
      item
        Name = 'FIWORKTIME'
        DataType = ftTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SEQ'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dsTimeInsertUpdate: TDataSource
    DataSet = qryUpdateTimeInsert
    Left = 200
    Top = 448
  end
  object usTimeInsert: TFDUpdateSQL
    Connection = con52Time
    InsertSQL.Strings = (
      'INSERT INTO TB_WORKTIMEINSERT'
      '(WTIT_SEQ, USERS_SEQ, WTIT_STWORKTIME, WTIT_FIWORKTIME, '
      '  WTIT_STEXCEPTTIME, WTIT_FIEXCEPTTIME, WTIT_DATE)'
      
        'VALUES (:NEW_WTIT_SEQ, :NEW_USERS_SEQ, :NEW_WTIT_STWORKTIME, :NE' +
        'W_WTIT_FIWORKTIME, '
      
        '  :NEW_WTIT_STEXCEPTTIME, :NEW_WTIT_FIEXCEPTTIME, :NEW_WTIT_DATE' +
        ')')
    ModifySQL.Strings = (
      'UPDATE TB_WORKTIMEINSERT'
      
        'SET WTIT_SEQ = :NEW_WTIT_SEQ, USERS_SEQ = :NEW_USERS_SEQ, WTIT_S' +
        'TWORKTIME = :NEW_WTIT_STWORKTIME, '
      
        '  WTIT_FIWORKTIME = :NEW_WTIT_FIWORKTIME, WTIT_STEXCEPTTIME = :N' +
        'EW_WTIT_STEXCEPTTIME, '
      
        '  WTIT_FIEXCEPTTIME = :NEW_WTIT_FIEXCEPTTIME, WTIT_DATE = :NEW_W' +
        'TIT_DATE'
      'WHERE WTIT_SEQ = :OLD_WTIT_SEQ')
    DeleteSQL.Strings = (
      'DELETE FROM TB_WORKTIMEINSERT'
      'WHERE WTIT_SEQ = :OLD_WTIT_SEQ')
    FetchRowSQL.Strings = (
      
        'SELECT WTIT_SEQ, USERS_SEQ, WTIT_STWORKTIME, WTIT_FIWORKTIME, WT' +
        'IT_STEXCEPTTIME, '
      '  WTIT_FIEXCEPTTIME, WTIT_DATE'
      'FROM TB_WORKTIMEINSERT'
      'WHERE WTIT_SEQ = :OLD_WTIT_SEQ')
    Left = 16
    Top = 224
  end
  object qryAutoTimeInsert: TFDQuery
    Active = True
    Connection = con52Time
    SQL.Strings = (
      'SELECT'
      'TB_WORKTIMEINSERT.*,'
      'TB_USERS.USERS_NAME'
      ''
      'FROM'
      'TB_WORKTIMEINSERT, TB_USERS'
      ''
      'WHERE'
      'TB_WORKTIMEINSERT.USERS_SEQ = TB_USERS.USERS_SEQ')
    Left = 104
    Top = 384
    object qryAutoTimeInsertWTIT_SEQ: TIntegerField
      Alignment = taCenter
      FieldName = 'WTIT_SEQ'
      Origin = 'WTIT_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAutoTimeInsertUSERS_SEQ: TIntegerField
      Alignment = taCenter
      FieldName = 'USERS_SEQ'
      Origin = 'USERS_SEQ'
    end
    object qryAutoTimeInsertWTIT_STWORKTIME: TTimeField
      Alignment = taCenter
      FieldName = 'WTIT_STWORKTIME'
      Origin = 'WTIT_STWORKTIME'
      DisplayFormat = 'hh:mm'
    end
    object qryAutoTimeInsertWTIT_FIWORKTIME: TTimeField
      Alignment = taCenter
      FieldName = 'WTIT_FIWORKTIME'
      Origin = 'WTIT_FIWORKTIME'
      DisplayFormat = 'hh:mm'
    end
    object qryAutoTimeInsertWTIT_STEXCEPTTIME: TTimeField
      Alignment = taCenter
      FieldName = 'WTIT_STEXCEPTTIME'
      Origin = 'WTIT_STEXCEPTTIME'
      DisplayFormat = 'hh:mm'
    end
    object qryAutoTimeInsertWTIT_FIEXCEPTTIME: TTimeField
      Alignment = taCenter
      FieldName = 'WTIT_FIEXCEPTTIME'
      Origin = 'WTIT_FIEXCEPTTIME'
      DisplayFormat = 'hh:mm'
    end
    object qryAutoTimeInsertWTIT_DATE: TSQLTimeStampField
      Alignment = taCenter
      FieldName = 'WTIT_DATE'
      Origin = 'WTIT_DATE'
    end
    object qryAutoTimeInsertUSERS_NAME: TWideStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'USERS_NAME'
      Origin = 'USERS_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
  end
  object dsAutoTimeInsert: TDataSource
    DataSet = qryAutoTimeInsert
    Left = 208
    Top = 384
  end
  object qryWeekday: TFDQuery
    Active = True
    Connection = con52Time
    SQL.Strings = (
      'SELECT *'
      'FROM TB_WEEKDAY')
    Left = 424
    Top = 32
  end
  object dsWeekday: TDataSource
    DataSet = qryWeekday
    Left = 496
    Top = 32
  end
end
