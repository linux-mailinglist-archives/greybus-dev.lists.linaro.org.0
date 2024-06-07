Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B2C905BA5
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Jun 2024 21:06:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B474944251
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Jun 2024 19:06:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lists.linaro.org (Postfix) with ESMTPS id 689DF3F3AD
	for <greybus-dev@lists.linaro.org>; Fri,  7 Jun 2024 20:56:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=quicinc.com header.s=qcppdkim1 header.b=CqrcyULt;
	spf=pass (lists.linaro.org: domain of quic_jjohnson@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_jjohnson@quicinc.com;
	dmarc=pass (policy=none) header.from=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457HZXuH001308;
	Fri, 7 Jun 2024 20:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LLEktn6rDt57s0EqrwNX46
	731GfXVlWL1F9A9v1PWI0=; b=CqrcyULtqlJpw9FHCahxxcJ4G395lzeWm6r8fW
	tnTMqUsGIwKgXfICfp9G5tEmY5DOofSQJcMtWvBfNXPsgrouDGIEKeEF/WPpyXrN
	3jJyXr8Z+wFoua/GUkwhAiXpTnkwuhqJPX7q8bEZCjxsJycHVsyB0+1/o1FJncv2
	xdBGFaRy5xIn6F/sopmdgqtCGHmQfQj2078qM7Iqf7qW0wZzSL/RGFmgeOACcUmM
	GLAR2Iw+W7NynW2eP2oFa6QshiQJE1qJQIIwDGsUuS4Srctr/1ylWFRXEOxC3mNh
	+9aI/wFynd32jH7hTtqgrBVUD2maTPFKmiI4H43SDEjosZ7w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjq2tq1by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 20:56:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457KucjW031196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 20:56:38 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 13:56:38 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 7 Jun 2024 13:56:37 -0700
MIME-Version: 1.0
Message-ID: <20240607-md-drivers-greybus-v1-1-31faa0b21105@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAR0Y2YC/x3MwQrCMAyA4VcZORtoa63gq4iHdI1bwFVJ3JiMv
 bvV43f4/w2MVdjg0m2gvIjJszb4Qwf9SHVglNIMwYXokjvjVLCoLKyGg/Inz4bkjzlFjj6cErT
 wpXyX9T+93pozGWNWqv34Wz2kzitOZG9W2Pcv+0zD8YMAAAA=
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bt2AVqkT0MVWf-Kb97p6CI7PlD2ECRof
X-Proofpoint-ORIG-GUID: bt2AVqkT0MVWf-Kb97p6CI7PlD2ECRof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=946 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070155
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 689DF3F3AD
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:205.220.168.131];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:26211, ipnet:205.220.168.0/24, country:US];
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
X-MailFrom: quic_jjohnson@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JJG7DNRQL2WWMRHJUGRYACKZKAY7BAZM
X-Message-ID-Hash: JJG7DNRQL2WWMRHJUGRYACKZKAY7BAZM
X-Mailman-Approved-At: Wed, 12 Jun 2024 19:06:01 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: add missing MODULE_DESCRIPTION() macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JJG7DNRQL2WWMRHJUGRYACKZKAY7BAZM/>
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

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/greybus/core.c | 1 +
 drivers/greybus/es2.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index 95c09d4f3a86..c28bb973f67c 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -375,5 +375,6 @@ static void __exit gb_exit(void)
 	tracepoint_synchronize_unregister();
 }
 module_exit(gb_exit);
+MODULE_DESCRIPTION("Greybus 'core' driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");
diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
index 1ee78d0d90b4..db4d033925e6 100644
--- a/drivers/greybus/es2.c
+++ b/drivers/greybus/es2.c
@@ -1456,5 +1456,6 @@ static struct usb_driver es2_ap_driver = {
 
 module_usb_driver(es2_ap_driver);
 
+MODULE_DESCRIPTION("Greybus 'AP' USB driver for 'ES2' controller chips");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240607-md-drivers-greybus-a13b64e41256

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
