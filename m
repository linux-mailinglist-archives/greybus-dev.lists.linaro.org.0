Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B2919944
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2024 22:41:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BEFC244113
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2024 20:41:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lists.linaro.org (Postfix) with ESMTPS id F15AE43C24
	for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2024 20:41:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=quicinc.com header.s=qcppdkim1 header.b=ncjhj1Fq;
	spf=pass (lists.linaro.org: domain of quic_jjohnson@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_jjohnson@quicinc.com;
	dmarc=pass (policy=none) header.from=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfS0e029236;
	Wed, 26 Jun 2024 20:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MPFeSDxJNesyJ1nbWQOwSi
	IbyfU/gMqfomQS4JyA3r0=; b=ncjhj1Fq+d2sRkAstgM9WH+hzl/UUv99BalXXT
	0Whz+u1Ei9m89p1zaN87kjfNaSDTp2kCTvTto8PsLyRiFwrxGFMK1BFu5905EUAR
	bUpGy7u/r4Od2OhVgvh37jxf+IasE07cOvJFHozhCgyvGMe+OdXgRiVV4dSzfxYF
	94GKBjTB4u26YI+Q3lahKILEqhO7hsY83MUIjHodv6tiHAzdSEFHC3bCngMcsE41
	i64xMkIHg2RmDBr53Rx4Gznaoup87TTWG2CPcO8wCBatT+wxBemheYKHfj2dnwp5
	0XMptN5dujAqWURaKGDFmTeVizEUhfr0or+ddfTIiIdKf7eg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6t8xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 20:41:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QKfBQ9023020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 20:41:11 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 13:41:10 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 26 Jun 2024 13:41:09 -0700
MIME-Version: 1.0
Message-ID: <20240626-md-drivers-greybus-v2-1-d520ffb9a489@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOR8fGYC/32OSw6DMAxEr1JlXVdJ+FTqqveoWCTBgKUSWhsiE
 OLuBQ7Q5ZNm3syqBJlQ1OOyKsZEQkPcwV4vKnQutghU76ystrku9R36GmqmhCzQMi5+EnAm82W
 OubFFqfbih7Gh+ZS+qp29EwTPLobuUL0pTjP0TkbkI96RjAMv54VkjtLftWTAQGYa57S3xuji+
 Z0oUAy3MPSq2rbtB7FRaqnVAAAA
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LEkuwiIVbKihnYeU1OAjdbniOXHS0SWj
X-Proofpoint-ORIG-GUID: LEkuwiIVbKihnYeU1OAjdbniOXHS0SWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260151
X-Rspamd-Queue-Id: F15AE43C24
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:205.220.180.131];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:22843, ipnet:205.220.180.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: PFBMUOZTAYTEWKSTJPUZ524NWXGOSPRA
X-Message-ID-Hash: PFBMUOZTAYTEWKSTJPUZ524NWXGOSPRA
X-MailFrom: quic_jjohnson@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus: add missing MODULE_DESCRIPTION() macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PFBMUOZTAYTEWKSTJPUZ524NWXGOSPRA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o

Add all missing invocations of the MODULE_DESCRIPTION() macro.

Acked-by: Alex Elder <elder@kernel.org>
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Changes in v2:
- Dropped the single quotes at the suggestion of Alex and pulled in
  his Acked-by tag
- Link to v1: https://lore.kernel.org/r/20240607-md-drivers-greybus-v1-1-31faa0b21105@quicinc.com
---
 drivers/greybus/core.c | 1 +
 drivers/greybus/es2.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index 95c09d4f3a86..33a47e73f0fa 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -375,5 +375,6 @@ static void __exit gb_exit(void)
 	tracepoint_synchronize_unregister();
 }
 module_exit(gb_exit);
+MODULE_DESCRIPTION("Greybus core driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");
diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
index 1ee78d0d90b4..69e46b1dff1f 100644
--- a/drivers/greybus/es2.c
+++ b/drivers/greybus/es2.c
@@ -1456,5 +1456,6 @@ static struct usb_driver es2_ap_driver = {
 
 module_usb_driver(es2_ap_driver);
 
+MODULE_DESCRIPTION("Greybus AP USB driver for ES2 controller chips");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240607-md-drivers-greybus-a13b64e41256

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
