import 'package:intl/intl.dart';

/// All common timezones, you can extend this with more timezones
enum TGTimeZone {
  A_ALPHA,
  ACDT,
  ACST,
  ADT,
  AEDT,
  AEST,
  AFT,
  AKDT,
  AKST,
  ALMT,
  AMST_ARMENIA,
  AMST_AMAZON,
  AMT_ARMENIA,
  AMT_AMAZON,
  ANAST,
  ANAT,
  AQTT,
  ART,
  AST_ARABIA,
  AST_ATLANTIC,
  AWDT,
  AWST,
  AZOST,
  AZOT,
  AZST,
  AZT,
  B_BRAVO,
  BNT,
  BOT,
  BRST,
  BRT,
  BST_BANGLASESH,
  BST_BRITISH,
  BTT,
  C_CHARLIE,
  CAST,
  CAT,
  CCT,
  CDT_CUBA,
  CDT_AMERICA,
  CEST,
  CET,
  CHADT,
  CHAST,
  CKT,
  CLST,
  CLT,
  COT,
  CST_CHINA,
  CST_AMERICA,
  CST_CUBA,
  CVT,
  CXT,
  ChST,
  D_DELTA,
  DAVT,
  E_ECHO,
  EASST,
  EAST,
  EAT,
  ECT,
  EDT,
  EDT_PACIFIC,
  EEST,
  EET,
  EGST,
  EGT,
  EST,
  ET,
  F_FOXTROX,
  FJST,
  FJT,
  FKST,
  FKT,
  FNT,
  G_GOLF,
  GALT,
  GAMT,
  GET,
  GFT,
  GILT,
  GST,
  GYT,
  H_HOTEL,
  HAA,
  HAC,
  HADT,
  HAE,
  HAP,
  HAR,
  HAST,
  HAT,
  HAY,
  HKT,
  HLV,
  HNA,
  HNC,
  HNE,
  HNP,
  HNR,
  HNT,
  HNY,
  HOVT,
  I_INDIA,
  ICT,
  IDT,
  IOT,
  IRDT,
  IRKST,
  IRKT,
  IRST,
  IST_ISRAEL,
  IST_INDIA,
  IST_IRISH,
  JST,
  K_KILO,
  KGT,
  KRAST,
  KRAT,
  KST,
  KUYT,
  L_LIMA,
  LHDT,
  LHST,
  LINT,
  M_MIKE,
  MAGST,
  MAGT,
  MART,
  MAWT,
  MDT,
  MESZ,
  MEZ,
  MHT,
  MMT,
  MSD,
  MSK,
  MST,
  MUT,
  MVT,
  MYT,
  N_NOVEMBER,
  NCT,
  NDT,
  NFT,
  NOVST,
  NOVT,
  NPT,
  NST,
  NUT,
  NZDT,
  NZST,
  O_OSCAR,
  OMST,
  OMSST,
  P_PAPA,
  PDT,
  PET,
  PETST,
  PETT,
  PGT,
  PHOT,
  PHT,
  PKT,
  PMDT,
  PMST,
  PONT,
  PST,
  PT_TIEMPO,
  PWT_PALAU,
  PYST,
  PYT,
  Q_QUEBEC,
  R_ROMEA,
  RET,
  S_SIERRA,
  SAMT,
  SAST,
  SBT,
  SCT,
  SGT,
  SRT,
  SST,
  T_TANGO,
  TAHT,
  TFT,
  TJT,
  TKT,
  TLT,
  TMT,
  TVT,
  U_UNIFORM,
  ULAT,
  UTC,
  UYST,
  UYT,
  UZT,
  V_VICTOR,
  VET,
  VLAST,
  VLAT,
  VUT,
  W_WHISKEY,
  WAST,
  WAT,
  WEST,
  WESZ,
  WET,
  WEZ,
  WFT,
  WGST,
  WGT,
  WIB,
  WIT,
  WITA,
  WST_AFRICA,
  WST_PACIFIC,
  WT,
  X_XRAY,
  Y_YANKEE,
  YAKST,
  YAKT,
  YAPT,
  YEKST,
  YEKT,
  Z_ZULU,
}

/// TGFramework's Date related implementation
class TGDateUtil {
  /// Default Date Pattern
  static const String _DATE_PATTERN = "yyyy-MM-dd";

  /// Default Date Time Pattern
  static const String _DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

  /// Formats Date
  static String formatDate(DateTime dateTime,
      {String datePattern = _DATE_PATTERN}) {
    return DateFormat(datePattern).format(dateTime);
  }

  /// Formats DateTime
  static String formatDateTime(DateTime dateTime,
      {String dateTimePattern = _DATE_TIME_PATTERN}) {
    return DateFormat(dateTimePattern).format(dateTime);
  }

  /// Parse Date
  static DateTime parseDate(String dateTime,
      {String datePattern = _DATE_PATTERN}) {
    return DateFormat(datePattern).parse(dateTime);
  }

  /// Parse DateTime
  static DateTime parseDateTime(String dateTime,
      {String dateTimePattern = _DATE_TIME_PATTERN}) {
    return DateFormat(dateTimePattern).parse(dateTime);
  }

  // Define offsets for common timezones
  static Duration _getTimeZoneOffsets(TGTimeZone timeZone) {
    switch (timeZone) {
      case TGTimeZone.A_ALPHA:
      case TGTimeZone.BST_BRITISH:
      case TGTimeZone.CET:
      case TGTimeZone.IST_IRISH:
      case TGTimeZone.MEZ:
      case TGTimeZone.WAT:
      case TGTimeZone.WEST:
      case TGTimeZone.WESZ:
      case TGTimeZone.WST_AFRICA:
        return const Duration(hours: 1);
      case TGTimeZone.B_BRAVO:
      case TGTimeZone.CAT:
      case TGTimeZone.CEST:
        return const Duration(hours: 2);
      case TGTimeZone.AST_ARABIA:
      case TGTimeZone.EAT:
      case TGTimeZone.EEST:
      case TGTimeZone.IDT:
      case TGTimeZone.C_CHARLIE:
        return const Duration(hours: 3);
      case TGTimeZone.IRST:
        return const Duration(hours: 3, minutes: 30);
      case TGTimeZone.GET:
      case TGTimeZone.GST:
      case TGTimeZone.KUYT:
      case TGTimeZone.MSD:
      case TGTimeZone.MSK:
      case TGTimeZone.MUT:
      case TGTimeZone.RET:
      case TGTimeZone.SAMT:
        return const Duration(hours: 4);
      case TGTimeZone.AFT:
      case TGTimeZone.IRDT:
        return const Duration(hours: 4, minutes: 30);
      case TGTimeZone.AMST_ARMENIA:
      case TGTimeZone.AQTT:
      case TGTimeZone.E_ECHO:
      case TGTimeZone.MAWT:
      case TGTimeZone.MVT:
      case TGTimeZone.PKT:
      case TGTimeZone.TFT:
      case TGTimeZone.TJT:
      case TGTimeZone.TMT:
      case TGTimeZone.UZT:
        return const Duration(hours: 5);
      case TGTimeZone.IST_INDIA:
        return const Duration(hours: 5, minutes: 30);
      case TGTimeZone.NPT:
        return const Duration(hours: 5, minutes: 45);
      case TGTimeZone.ALMT:
      case TGTimeZone.BST_BANGLASESH:
      case TGTimeZone.BTT:
      case TGTimeZone.F_FOXTROX:
      case TGTimeZone.IOT:
      case TGTimeZone.KGT:
      case TGTimeZone.NOVT:
      case TGTimeZone.YEKST:
        return const Duration(hours: 6);
      case TGTimeZone.CCT:
      case TGTimeZone.MMT:
        return const Duration(hours: 6, minutes: 30);
      case TGTimeZone.CXT:
      case TGTimeZone.G_GOLF:
      case TGTimeZone.HOVT:
      case TGTimeZone.ICT:
      case TGTimeZone.NOVST:
      case TGTimeZone.OMSST:
      case TGTimeZone.OMST:
      case TGTimeZone.WIB:
        return const Duration(hours: 7);
      case TGTimeZone.PHT:
      case TGTimeZone.SGT:
      case TGTimeZone.ULAT:
      case TGTimeZone.WITA:
      case TGTimeZone.CST_CHINA:
        return const Duration(hours: 8);
      case TGTimeZone.AWDT:
      case TGTimeZone.I_INDIA:
      case TGTimeZone.IRKST:
      case TGTimeZone.IRKT:
      case TGTimeZone.JST:
      case TGTimeZone.KST:
      case TGTimeZone.PWT_PALAU:
      case TGTimeZone.TLT:
      case TGTimeZone.WIT:
        return const Duration(hours: 9);
      case TGTimeZone.ACST:
        return const Duration(hours: 9, minutes: 30);
      case TGTimeZone.AEST:
      case TGTimeZone.ChST:
      case TGTimeZone.K_KILO:
      case TGTimeZone.PGT:
      case TGTimeZone.YAKST:
      case TGTimeZone.YAKT:
      case TGTimeZone.YAPT:
        return const Duration(hours: 10);
      case TGTimeZone.ACDT:
      case TGTimeZone.LHST:
        return const Duration(hours: 10, minutes: 30);
      case TGTimeZone.AEDT:
      case TGTimeZone.EDT:
      case TGTimeZone.L_LIMA:
      case TGTimeZone.LHDT:
      case TGTimeZone.NCT:
      case TGTimeZone.PONT:
      case TGTimeZone.SBT:
      case TGTimeZone.VLAST:
      case TGTimeZone.VLAT:
      case TGTimeZone.VUT:
        return const Duration(hours: 11);
      case TGTimeZone.NFT:
        return const Duration(hours: 11, minutes: 30);
      case TGTimeZone.ANAST:
      case TGTimeZone.ANAT:
      case TGTimeZone.FJT:
      case TGTimeZone.GILT:
      case TGTimeZone.M_MIKE:
      case TGTimeZone.MAGST:
      case TGTimeZone.MAGT:
      case TGTimeZone.MHT:
      case TGTimeZone.NZST:
      case TGTimeZone.PETST:
      case TGTimeZone.PETT:
      case TGTimeZone.TVT:
      case TGTimeZone.WFT:
        return const Duration(hours: 12, minutes: 30);
      case TGTimeZone.CHAST:
        return const Duration(hours: 12, minutes: 45);
      case TGTimeZone.FJST:
      case TGTimeZone.NZDT:
      case TGTimeZone.PHOT:
      case TGTimeZone.TKT:
      case TGTimeZone.WST_PACIFIC:
        return const Duration(hours: 13);
      case TGTimeZone.CHADT:
        return const Duration(hours: 13, minutes: 45);
      case TGTimeZone.LINT:
        return const Duration(hours: 14);
      case TGTimeZone.AZOT:
      case TGTimeZone.CVT:
      case TGTimeZone.EGT:
        return const Duration(hours: -1);
      case TGTimeZone.BRST:
      case TGTimeZone.FNT:
        return const Duration(hours: -2);
      case TGTimeZone.NDT:
      case TGTimeZone.HAT:
        return const Duration(hours: -2, minutes: 30);
      case TGTimeZone.ADT:
      case TGTimeZone.HAT:
      case TGTimeZone.AMST_AMAZON:
      case TGTimeZone.BRT:
      case TGTimeZone.CLST:
      case TGTimeZone.FKST:
      case TGTimeZone.GFT:
      case TGTimeZone.HAA:
      case TGTimeZone.P_PAPA:
      case TGTimeZone.PMST:
      case TGTimeZone.PYST:
      case TGTimeZone.SRT:
      case TGTimeZone.UYT:
      case TGTimeZone.WGT:
        return const Duration(hours: -3);
      case TGTimeZone.HNT:
      case TGTimeZone.NST:
        return const Duration(hours: -3, minutes: 30);
      case TGTimeZone.AMT_AMAZON:
      case TGTimeZone.AST_ATLANTIC:
      case TGTimeZone.BOT:
      case TGTimeZone.CDT_CUBA:
      case TGTimeZone.CLT:
      case TGTimeZone.EDT:
      case TGTimeZone.FKT:
      case TGTimeZone.GYT:
      case TGTimeZone.HAE:
      case TGTimeZone.HNA:
      case TGTimeZone.PYT:
      case TGTimeZone.Q_QUEBEC:
        return const Duration(hours: -4);
      case TGTimeZone.HLV:
      case TGTimeZone.VET:
        return const Duration(hours: -4, minutes: 30);
      case TGTimeZone.CDT_AMERICA:
      case TGTimeZone.COT:
      case TGTimeZone.CST_CUBA:
      case TGTimeZone.EASST:
      case TGTimeZone.ECT:
      case TGTimeZone.EST:
      case TGTimeZone.ET:
      case TGTimeZone.HAC:
      case TGTimeZone.HNE:
      case TGTimeZone.PET:
      case TGTimeZone.R_ROMEA:
        return const Duration(hours: -5);
      case TGTimeZone.CST_AMERICA:
      case TGTimeZone.EAST:
      case TGTimeZone.GALT:
      case TGTimeZone.HAR:
      case TGTimeZone.HNC:
      case TGTimeZone.MDT:
      case TGTimeZone.S_SIERRA:
        return const Duration(hours: -6);
      case TGTimeZone.HAP:
      case TGTimeZone.HNR:
      case TGTimeZone.MST:
      case TGTimeZone.PDT:
      case TGTimeZone.T_TANGO:
        return const Duration(hours: -7);
      case TGTimeZone.PST:
      case TGTimeZone.PT_TIEMPO:
      case TGTimeZone.U_UNIFORM:
        return const Duration(hours: -8);
      case TGTimeZone.V_VICTOR:
        return const Duration(hours: -9);
      case TGTimeZone.MART:
        return const Duration(hours: -9, minutes: 30);
      case TGTimeZone.CKT:
      case TGTimeZone.HAST:
      case TGTimeZone.TAHT:
      case TGTimeZone.W_WHISKEY:
        return const Duration(hours: -10);
      case TGTimeZone.NUT:
      case TGTimeZone.SST:
      case TGTimeZone.X_XRAY:
        return const Duration(hours: -11);
      case TGTimeZone.Y_YANKEE:
        return const Duration(hours: -12);
      default:
        return const Duration(hours: 0);
    }
  }

  static DateTime convertTimezoneWithDateTime(
      DateTime fromTime, TGTimeZone fromTimeZone, TGTimeZone toTimeZone,
      {String dateTimePattern = _DATE_TIME_PATTERN}) {
    // Parse the input datetime
    final originalTime =
        DateTime.parse(DateFormat(dateTimePattern).format(fromTime));

    // Get the offset for the source and target timezones
    Duration? fromOffset = _getTimeZoneOffsets(fromTimeZone);
    Duration? toOffset = _getTimeZoneOffsets(toTimeZone);

    if (!toOffset.isNegative && fromOffset.isNegative) {
      fromOffset = fromOffset + const Duration(hours: 1);
    }

    if (toOffset.isNegative && !fromOffset.isNegative) {
      fromOffset = fromOffset - const Duration(hours: 1);
    }

    // Adjust the time fromTimezone > toTimezone
    final convertedTime = originalTime.subtract(fromOffset - toOffset);

    return convertedTime;
  }

  static String convertTimezoneWithString(
      String fromTime, TGTimeZone fromTimeZone, TGTimeZone toTimeZone,
      {String dateTimePattern = _DATE_TIME_PATTERN}) {
    final DateFormat dateFormat = DateFormat(dateTimePattern);

    // Parse the input datetime
    final originalTime = DateTime.parse(fromTime);

    // Get the offset for the source and target timezones
    Duration? fromOffset = _getTimeZoneOffsets(fromTimeZone);
    Duration? toOffset = _getTimeZoneOffsets(toTimeZone);

    if (!toOffset.isNegative && fromOffset.isNegative) {
      fromOffset = fromOffset + const Duration(hours: 1);
    }

    if (toOffset.isNegative && !fromOffset.isNegative) {
      fromOffset = fromOffset - const Duration(hours: 1);
    }

    // Adjust the time fromTimezone > toTimezone
    final convertedTime = originalTime.subtract(fromOffset - toOffset);
    return dateFormat.format(convertedTime);
  }
}
