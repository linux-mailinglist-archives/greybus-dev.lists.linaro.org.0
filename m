Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616CA771C7
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 02:17:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9AFF044291
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 00:17:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lists.linaro.org (Postfix) with ESMTPS id 2B3EB44291
	for <greybus-dev@lists.linaro.org>; Tue,  1 Apr 2025 00:17:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=quicinc.com header.s=qcppdkim1 header.b=peSfyLyV;
	spf=pass (lists.linaro.org: domain of quic_jjohnson@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_jjohnson@quicinc.com;
	dmarc=pass (policy=none) header.from=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCx7d007639;
	Tue, 1 Apr 2025 00:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWf+aubKFbVlYI+VsLmquwJeB6ZKPlgud/1Pn+keFGM=; b=peSfyLyVdwqRqmov
	KGQOieE3z41dL+fBcGU37rjGC3q3t25BTyxD/2sF3ikRseeSxFu4kcQAvUwPGtNF
	xfN9sD8v+gc1HHlTBuPK1ww8GSRIj7y+5JbovAAL+KnPFyd1BGuA67sRKPiVIafD
	XH3bsL6kYHNMiABTmXFGr5zhEC6kzrMe+7Hm5Gd5MLplLOaDFRCm9mUyWNwCobii
	DNjX4NjcwT4guaWJp8hRO1OUGFrpOkM7yNl2pj+bK4W3cZzlD7/kbT7tOrUMUC66
	2ZselXOZN1fxcMlePEO4VH1qIkCUlObvST1cP/6sQtu69WaDh/oQ2u2DvblIeEKF
	AD9/og==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nwumu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 00:17:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5310HMoj011319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 00:17:22 GMT
Received: from [10.111.180.55] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 17:17:21 -0700
Message-ID: <4f47df18-e98c-4f23-afde-3fa8e9fd0f86@quicinc.com>
Date: Mon, 31 Mar 2025 17:17:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>,
        Alex Elder
	<elder@riscstar.com>
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
 <d683962c-e8b7-4adc-9902-483976197637@riscstar.com>
 <CALVXb-qDioGFAfmtJPu_jVR_5G7VfC2bDD_bvjicbrVZKkc=hA@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <CALVXb-qDioGFAfmtJPu_jVR_5G7VfC2bDD_bvjicbrVZKkc=hA@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WAs377hhi2Z2IkrrkwWxXmTjQS2ZrgW3
X-Proofpoint-GUID: WAs377hhi2Z2IkrrkwWxXmTjQS2ZrgW3
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67eb3092 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=1O7B8se6RwbiryXEGoAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010000
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2B3EB44291
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.98 / 15.00];
	REPLY(-4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[205.220.168.131:from];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	BAYES_HAM(-0.48)[79.52%];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:205.220.168.131];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nexus-software.ie,lists.linaro.org,lists.linux.dev,vger.kernel.org];
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
Message-ID-Hash: E2PVGO4CTWHULGYID2UPO3JRLA6C5RMC
X-Message-ID-Hash: E2PVGO4CTWHULGYID2UPO3JRLA6C5RMC
X-MailFrom: quic_jjohnson@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Multiple cleanups and refactors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E2PVGO4CTWHULGYID2UPO3JRLA6C5RMC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMy8zMS8yMDI1IDU6MDMgUE0sIEdhbmVzaCBLdW1hciBQaXR0YWxhIHdyb3RlOg0KPiBIaSBB
bGV4LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgZGV0YWlsZWQgZmVlZGJhY2sgYW5kIGd1aWRh
bmNlLiBJIGFwcHJlY2lhdGUgeW91ciB0aW1lDQo+IHJldmlld2luZyB0aGUgcGF0Y2guDQo+IA0K
PiBJ4oCZbGwgc3BsaXQgdGhlIGNoYW5nZXMgaW50byBzZXBhcmF0ZSBwYXRjaGVzIGFzIHN1Z2dl
c3RlZCBhbmQgc2VuZCBhIHYyIHNob3J0bHkuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEdhbmVz
aCBQaXR0YWxhDQoNClNvbWUgbW9yZSBmZWVkYmFjazoNCg0KRG9uJ3QgInRvcCBwb3N0Ig0KaHR0
cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJtaXR0aW5nLXBh
dGNoZXMuaHRtbCN1c2UtdHJpbW1lZC1pbnRlcmxlYXZlZC1yZXBsaWVzLWluLWVtYWlsLWRpc2N1
c3Npb25zDQoNCkFsc28gZG9uJ3QgdXNlIEhUTUwgZS1tYWlsIA0KaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNuby1t
aW1lLW5vLWxpbmtzLW5vLWNvbXByZXNzaW9uLW5vLWF0dGFjaG1lbnRzLWp1c3QtcGxhaW4tdGV4
dA0KDQpZZXMsIHRoZXJlIGFyZSBhIGxvdCBvZiBob29wcyB5b3UgaGF2ZSB0byBqdW1wIHRocm91
Z2ggdG8gZ2V0IHlvdXIgY29kZSBpbiB0aGUNCmtlcm5lbC4gSXQgYmVjb21lcyBlYXNpZXIgb3Zl
ciB0aW1lLg0KDQovamVmZg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
