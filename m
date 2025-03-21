Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CD82BA6BD24
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Mar 2025 15:37:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CE76E45F4D
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Mar 2025 14:37:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lists.linaro.org (Postfix) with ESMTPS id 143284582B
	for <greybus-dev@lists.linaro.org>; Fri, 21 Mar 2025 14:37:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=quicinc.com header.s=qcppdkim1 header.b=cfZoLcI6;
	dmarc=pass (policy=none) header.from=quicinc.com;
	spf=pass (lists.linaro.org: domain of quic_jjohnson@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_jjohnson@quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATEER031803;
	Fri, 21 Mar 2025 14:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUAuubmhP/bAgXWQaiCREHxXWbMHCn3WKpV9q57SXdk=; b=cfZoLcI6hOuqbkYM
	RJbQINSNj8Y0/DFE+IguY2WfAbFWf4skwfZTlrciWzr+M6zrVxrpYxHwPtxvxFKz
	GupoPjJN4R5ggnfO2SO3hMFJKLcCGN236KCEv5r0phMve4WoMgAAkhJ7cB6rBEk1
	SPk7Rnclqt/e8AcLmtAWFrVvJptrWcjkpO07OszwNdCMmcoCptKU/7KRias5bOGL
	pAWjSiSCGICQMzJqPXvxgDGjsOT8Sr2pKPg4YnlUCGiodFefl8GlXWUO7dvzRXtG
	VRSCK2M4ssTHDUNlwnHTK5RZxGyyG8RtfI9qnE+T0Q6A0LkHQ6SV8xlGsc4LdeEs
	D3r4sA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gt5kjfc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 14:37:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LEbVTd032366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 14:37:31 GMT
Received: from [10.111.179.44] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Mar
 2025 07:37:30 -0700
Message-ID: <acbe5688-9be4-489b-8a9c-4950dc3b8133@quicinc.com>
Date: Fri, 21 Mar 2025 07:37:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ErickKaranja <karanja99erick@gmail.com>, <hvaibhav.linux@gmail.com>,
        <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>,
        <outreachy@lists.linux.dev>
References: <20250321115545.24468-1-karanja99erick@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250321115545.24468-1-karanja99erick@gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N3pmzDtsjdnERo5NIcyFkfj6JxdhvGaw
X-Proofpoint-ORIG-GUID: N3pmzDtsjdnERo5NIcyFkfj6JxdhvGaw
X-Authority-Analysis: v=2.4 cv=PsuTbxM3 c=1 sm=1 tr=0 ts=67dd79ac cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=UII2AE8if6k0RuonElUA:9
 a=QEXdDO2ut3YA:10 a=KpMAsf9diV4A:10 a=ftr0zfsHvHYA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210106
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 143284582B
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[205.220.168.131:from];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:205.220.168.131];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:26211, ipnet:205.220.168.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+]
Message-ID-Hash: DKIGNP77RNATO7LEEL7SZAXPVALKOKQV
X-Message-ID-Hash: DKIGNP77RNATO7LEEL7SZAXPVALKOKQV
X-MailFrom: quic_jjohnson@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix line length issue
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DKIGNP77RNATO7LEEL7SZAXPVALKOKQV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/21/2025 4:55 AM, ErickKaranja wrote:
> Fix line length exceeding 100 columns in arche-platform.c. The code now
> follows Linux kernel coding style guidelines by keeping lines under the
> maximum allowed length of 100 characters.
> 
> Reported by checkpatch:
> 
> CHECK: line length of 101 exceeds 100 columns
> 
> Signed-off-by: ErickKaranja <karanja99erick@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index d48464390f58..1a82a7a3991c 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -179,8 +179,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				 */
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +					arche_platform_set_wake_detect_state
> +						(arche_pdata, WD_STATE_COLDBOOT_TRIG);
>  					spin_unlock_irqrestore(&arche_pdata->wake_lock,
>  							       flags);
>  					return IRQ_WAKE_THREAD;

I see you already received some good feedback. However I think the most
important feedback wasn't given, namely that checkpatch performs rigorous
enforcement of Coding Style guidelines that themselves are not always rigorous.

For line length the Coding Style still says the "preferred limit" is 80
columns. But whether it is 80 or 100, the Coding Style has this very important
caveat: Statements longer than [the limit] should be broken into sensible
chunks, unless exceeding [the limit] significantly increases readability.

<https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings>

Obviously this is subjective, but for me the original code is significantly
more readable than the patched code.

So the takeaway is that not every checkpatch issue should be "fixed".

/jeff
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
