Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 14875A771C1
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 02:13:09 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22E2544898
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 00:13:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lists.linaro.org (Postfix) with ESMTPS id CE87E44291
	for <greybus-dev@lists.linaro.org>; Tue,  1 Apr 2025 00:12:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=quicinc.com header.s=qcppdkim1 header.b=LISj3Dtc;
	spf=pass (lists.linaro.org: domain of quic_jjohnson@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_jjohnson@quicinc.com;
	dmarc=pass (policy=none) header.from=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCsUr025871;
	Tue, 1 Apr 2025 00:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9CsQXCljYAEI4ooaI8R2MI2V5Ea03tYX+haiN1yBCk=; b=LISj3Dtc4ums0pyw
	3DXyxp2BqreXO7+UVrtZ7QDIebaYhk4xf8vzA+4HbvLUqi01Nn4K4XNlq6CHZfEp
	se3VXjeIOkLokIPwxo+vCNqoZj0GY34rd0WJnNZndCy74B+VIjrhhDUYfD0XD6Bd
	9CykS7kwfCcD7dV/iOov1NJgKRqc++aTbCHV+OK9GztAZF7BhnbKvq9QoTmVuOZJ
	DEoyvFwm95tHp8jbyCnHH0Xdn43JDTAhDh7NNN+e8k9nbh5Ob9zJJQPDh9qvGQ8F
	BhqT855nNIF0tWGf+FML0fmxV6xvfGuZIqcM9iZxv5y93zH5ed9GzjMEYWPbfDro
	p/FV+Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhp51h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 00:12:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5310CrHC018670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 00:12:53 GMT
Received: from [10.111.180.55] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 17:12:53 -0700
Message-ID: <5773d200-1d9d-4d6e-b01e-10d962ee9e8e@quicinc.com>
Date: Mon, 31 Mar 2025 17:12:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: gpittala <ganeshkpittala@gmail.com>, <johan@kernel.org>,
        <elder@kernel.org>, <gregkh@linuxfoundation.org>
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250331213337.6171-1-ganeshkpittala@gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NXDJnbNn600e-UQ6vM-iqUuIN2VIfpIo
X-Proofpoint-ORIG-GUID: NXDJnbNn600e-UQ6vM-iqUuIN2VIfpIo
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67eb2f86 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Jb6bjuR1jG5_EaSFLQYA:9
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310165
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CE87E44291
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.51 / 15.00];
	REPLY(-4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:205.220.168.131];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.01)[46.73%];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	FREEMAIL_CC(0.00)[gmail.com,nexus-software.ie,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	ASN(0.00)[asn:26211, ipnet:205.220.168.0/24, country:US];
	HAS_XOIP(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RBL_SENDERSCORE_REPUT_UNKNOWN_FAIL(0.00)[205.220.168.131:query timed out];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: UHS4NSQAQD3RLSMRKSBASATBXQNNLB7G
X-Message-ID-Hash: UHS4NSQAQD3RLSMRKSBASATBXQNNLB7G
X-MailFrom: quic_jjohnson@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Multiple cleanups and refactors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UHS4NSQAQD3RLSMRKSBASATBXQNNLB7G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/31/2025 2:33 PM, gpittala wrote:
> This patch includes multiple meaningful cleanups for the Greybus staging driver:
> 
> 1. firmware.c: Replaced deprecated 'strncpy()' with 'strscpy()'
> 2. sysfs show functions: Replaced 'sprintf()' with 'sysfs_emit()'
> 3. loopback.c: Refactored a large function (gp_loopback_fn) to improve readability
> 4. audio_gb.c: Split logic in get_topology() into separate calls as per TODO
> 
> All changes are tested and pass checkpatch.pl
> 
> Signed-off-by: gpittala <ganeshkpittala@gmail.com>

Please refer to:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

So it is generally expected that "gpittala" be replaced with "a known
identity" which is normally your actual name.
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
