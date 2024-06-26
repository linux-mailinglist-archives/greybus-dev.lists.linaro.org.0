Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E06A9198CE
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2024 22:15:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F34D844885
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2024 20:15:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lists.linaro.org (Postfix) with ESMTPS id C89D840E1F
	for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2024 16:05:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=quicinc.com header.s=qcppdkim1 header.b=UfdZj7pj;
	spf=pass (lists.linaro.org: domain of quic_jjohnson@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_jjohnson@quicinc.com;
	dmarc=pass (policy=none) header.from=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfa5Y029266;
	Wed, 26 Jun 2024 16:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SP0Z/riTEA3aysdgIqwT0ua236dKkY1TkPD4qdytLQE=; b=UfdZj7pj9bQTYF/N
	TxNCUv3bSIvo8e1tIeFhDWa4CBJBNBxrZHLeqog5OmFjjvCNssNmMi8Z97A2ulYT
	llNuulQ3JcaHIWw5kGpwyDUgpXaASbZ9SzFkPjefLBP1fEOJxrbPviMdM4gNP0A6
	JU1FycaKx0a0OY27DMesIb2wCJV4z8Rw9szhvPsKfanIv0BeNylDxt8yNCp0C7pM
	KFkRbRpLu6nUcpJDIXyM0vWiTfPEEdVpFIfv7DC/iQynF4J4cYlbRc4LMkJxF8YG
	zCCy/lYIUHGW5AzLnL3O/YSMr0V41cr5B5s7mllfIagm/3ItH/TRysHNGq6NSlby
	MAqi8Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6srgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:05:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QG55Vj010780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:05:05 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 09:05:05 -0700
Message-ID: <fec0d711-ea96-4f94-9a9e-5d1b16d29d0f@quicinc.com>
Date: Wed, 26 Jun 2024 09:05:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240607-md-drivers-greybus-v1-1-31faa0b21105@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240607-md-drivers-greybus-v1-1-31faa0b21105@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fBk-TPsg2gkDr-FPVlHw_IM-_LUCcRlo
X-Proofpoint-ORIG-GUID: fBk-TPsg2gkDr-FPVlHw_IM-_LUCcRlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260117
X-Rspamd-Queue-Id: C89D840E1F
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:205.220.180.131];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:22843, ipnet:205.220.180.0/24, country:US];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: quic_jjohnson@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CSLAFN52BE7JXZJUQZIHU4XASNRFGLM5
X-Message-ID-Hash: CSLAFN52BE7JXZJUQZIHU4XASNRFGLM5
X-Mailman-Approved-At: Wed, 26 Jun 2024 20:15:23 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: add missing MODULE_DESCRIPTION() macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CSLAFN52BE7JXZJUQZIHU4XASNRFGLM5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/7/2024 1:56 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
> 
> Add all missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/greybus/core.c | 1 +
>  drivers/greybus/es2.c  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
> index 95c09d4f3a86..c28bb973f67c 100644
> --- a/drivers/greybus/core.c
> +++ b/drivers/greybus/core.c
> @@ -375,5 +375,6 @@ static void __exit gb_exit(void)
>  	tracepoint_synchronize_unregister();
>  }
>  module_exit(gb_exit);
> +MODULE_DESCRIPTION("Greybus 'core' driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");
> diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
> index 1ee78d0d90b4..db4d033925e6 100644
> --- a/drivers/greybus/es2.c
> +++ b/drivers/greybus/es2.c
> @@ -1456,5 +1456,6 @@ static struct usb_driver es2_ap_driver = {
>  
>  module_usb_driver(es2_ap_driver);
>  
> +MODULE_DESCRIPTION("Greybus 'AP' USB driver for 'ES2' controller chips");
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240607-md-drivers-greybus-a13b64e41256
> 

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
