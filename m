Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 157C4A90C9D
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 21:54:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 161D245F88
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 19:54:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lists.linaro.org (Postfix) with ESMTPS id 0A19545F88
	for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 19:54:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=quicinc.com header.s=qcppdkim1 header.b=n06wiRZH;
	spf=pass (lists.linaro.org: domain of quic_jjohnson@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_jjohnson@quicinc.com;
	dmarc=pass (policy=none) header.from=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mjGs007820;
	Wed, 16 Apr 2025 19:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnjEKaAwKTEtDaCYnG44TvlHj2XPzZ1wrYhnoD26JF8=; b=n06wiRZHqtIm1oZd
	kjAc78dHq11YF7W6bgB6MJNabCAP7d3lj7owOAaq3ciiAH8V2mj9Hp3sX3aX8KoD
	vEHgWp5Qo4W0cmVJL6HPIaAJx9aly4VAggWFRt4/i8bS3i4357ogWqjTw9IOELwO
	txn2kSyzlNavmEbxeoTmQel/FIHtOltP+S+vUn/51YOYkVWm5biYQQyo7V8K2ldr
	cOAxvVZL9GVKx+LwQud5HCPIEzmBZX0O65ony7TqC99rO+dD7LnZVyte88e88XjU
	AZQgV8tWmoBPb1FWAvTW8wx8vtFkJYpHza2Hh12mxCqcdiji7XEqELflx51J+zJH
	jJPWLg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6mrr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:54:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GJsfdj027392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:54:41 GMT
Received: from [10.111.181.123] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 12:54:40 -0700
Message-ID: <b25547ce-f16b-4594-baf3-afb0346c90f2@quicinc.com>
Date: Wed, 16 Apr 2025 12:54:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>, <johan@kernel.org>,
        <elder@kernel.org>, <gregkh@linuxfoundation.org>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
 <20250413073220.15931-2-ganeshkpittala@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250413073220.15931-2-ganeshkpittala@gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nR_WgbeSUnXWSUjpVrwTEIaNtdBRLRRC
X-Proofpoint-GUID: nR_WgbeSUnXWSUjpVrwTEIaNtdBRLRRC
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68000b01 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=o4_jF1gwsiqNhuO3VYgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=582 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160162
X-Rspamd-Queue-Id: 0A19545F88
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.37 / 15.00];
	BAYES_HAM(-2.87)[99.44%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[205.220.168.131:from];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:205.220.168.131];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[quicinc.com:mid,quicinc.com:dkim,mx0a-0031df01.pphosted.com:helo,mx0a-0031df01.pphosted.com:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,nexus-software.ie];
	DKIM_TRACE(0.00)[quicinc.com:+];
	ASN(0.00)[asn:26211, ipnet:205.220.168.0/24, country:US];
	HAS_XOIP(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: GMWIGM5AQFZYCXPRTOEP6RLTECFG4ADP
X-Message-ID-Hash: GMWIGM5AQFZYCXPRTOEP6RLTECFG4ADP
X-MailFrom: quic_jjohnson@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/4] staging: greybus: replace deprecated strncpy with strscpy in firmware.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GMWIGM5AQFZYCXPRTOEP6RLTECFG4ADP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gNC8xMy8yMDI1IDEyOjMyIEFNLCBHYW5lc2ggS3VtYXIgUGl0dGFsYSB3cm90ZToNCj4gVGhp
cyBwYXRjaCByZXBsYWNlcyB0aGUgdXNlIG9mIHRoZSBkZXByZWNhdGVkIHN0cm5jcHkoKSBmdW5j
dGlvbiB3aXRoDQo+IHN0cnNjcHkoKSBpbiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9Eb2N1bWVu
dGF0aW9uL2Zpcm13YXJlL2Zpcm13YXJlLmMuDQoNClJldmlldzoNCmh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwjZGVz
Y3JpYmUteW91ci1jaGFuZ2VzDQoNCkVzcGVjaWFsbHk6DQpEZXNjcmliZSB5b3VyIGNoYW5nZXMg
aW4gaW1wZXJhdGl2ZSBtb29kLCBlLmcuIOKAnG1ha2UgeHl6enkgZG8gZnJvdHrigJ0gaW5zdGVh
ZA0Kb2Yg4oCcW1RoaXMgcGF0Y2hdIG1ha2VzIHh5enp5IGRvIGZyb3R64oCdIG9yIOKAnFtJXSBj
aGFuZ2VkIHh5enp5IHRvIGRvIGZyb3R64oCdLCBhcw0KaWYgeW91IGFyZSBnaXZpbmcgb3JkZXJz
IHRvIHRoZSBjb2RlYmFzZSB0byBjaGFuZ2UgaXRzIGJlaGF2aW91ci4NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
