Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Gi5F/4PpmkkJwAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Mar 2026 23:32:30 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6C1E58F1
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Mar 2026 23:32:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4DA8640164
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Mar 2026 22:32:28 +0000 (UTC)
Received: from mx0b-0024c301.pphosted.com (mx0b-0024c301.pphosted.com [148.163.153.153])
	by lists.linaro.org (Postfix) with ESMTPS id 4D33F40157
	for <greybus-dev@lists.linaro.org>; Mon,  2 Mar 2026 21:58:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=silabs.com header.s=pps12202023 header.b=CttkUcz8;
	dkim=pass header.d=silabs.com header.s=selector1 header.b=IJmcrEPc;
	dmarc=pass (policy=reject) header.from=silabs.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1");
	spf=pass (lists.linaro.org: domain of "prvs=1521e20967=damien.riegel@silabs.com" designates 148.163.153.153 as permitted sender) smtp.mailfrom="prvs=1521e20967=damien.riegel@silabs.com"
Received: from pps.filterd (m0101742.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622F0sLx2214633;
	Mon, 2 Mar 2026 15:58:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=AWpKDPTQ3YkZJsG+dPnKBn4p/YZ3R6PBMeI4YkvZQzY=; b=CttkUcz8Nrqs
	gp6fsAbdG6qC29Nqg9IkDb6jBd9qSowSA1gCAeSl67/xKEMYT9f8NzaYY8J7p9g0
	GU4rA29MIVIP+ZmzioT37g4LkOvsTJ/bXNU3mFl0X6m111wPgFdHKcsPlUHLCIA2
	8B+xzmH0Mjv9Cku/lbZQedmAQrJz0vNL0CFDUukh+CtngluuEje44TueHWXpptpb
	s4W6b6X7mXnsqdCNA2D/csoNZR/2MZazMzqnzAI22ZPtHluYsD6HNbSsket51dkl
	3vlo40td1jKwWGay5+GJLvdjgpL1Lk2NTZVqYaspNwTL9awmKjiukY2PGHbMcw1B
	SuxXnmGXyQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022080.outbound.protection.outlook.com [40.93.195.80])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4cktr9vf8f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 15:58:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTRvP3ypS6ScSHEAqDZ+rCVK/fsz8CZQXWx9Vqqc5zEnfbo+PaU4trpO0QWbTxlXNEW5yIRUYNq79xNIat3qUeibuTDqWWJow36vDI3vgNxpEvZXp+zrOEaH++Nh0YoK75Gv2mYl5Gbg6Xdnn4Qio8ywmoTvIPCq7EFRQ7VACohw6xVa3WCB2TOu9FFs3//hrayRf4nnhOlfob/VJOx+uQad4T5+08YPHgyC/F0bWvzo8eH25HsNOcuvwbnXiMtUv+lxGxJHwsQZQJOVRk0YL4Jjv7zyh8KPK31hPLDvGUSlnfEP7k4EhOX/AHpkDWNfV84vM4HyWB8i7QtegmpZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWpKDPTQ3YkZJsG+dPnKBn4p/YZ3R6PBMeI4YkvZQzY=;
 b=B8saZIab97ujmX8IJAIcYcOSuaoMPXDZUw/wPXW9B0LhajXghGKiaPCnkD9yBeetyh5DRjW+YyMrja0mdwWlqheF/XH2OyO5HhLx5JBBp3daRTq3ikIOgwxW/N70KtZ6uxNBTr1/5xZ4Pqen0Pl8p9QvftX2UxuPHC0/hwtREexkYAb2zGQZAruZAv0OUFA7ONO28o0ip0KyboGlgOSJy7JcQvDwL1JlpAP2Xd7JfJfEm+YWogXcVHdjpPqqfmPCqMd6lbWm+La/m6YRYstvK93CtEKzOmDgRm6WlvNvd7q4oM+av3CFqKFWrP8CX8rMQqMKf6TpBcvJBSVdWZXQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWpKDPTQ3YkZJsG+dPnKBn4p/YZ3R6PBMeI4YkvZQzY=;
 b=IJmcrEPctOoLL18T48ev3lgG4KbdkUAWPknUNIDAdR1viGqj/m1qplkwMVqbS4crZ9W+YXmDvu/Lw+lSzKluFcFCxI+eQMyeKttffqWgWvYNzfQIBdWqJxwJQLI4xdaGgIDRnJiurNvG7BBvLoTEjmaPNXn08jSC7AjCUHsKcf4=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by IA3PR11MB8920.namprd11.prod.outlook.com (2603:10b6:208:578::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 21:57:58 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::2de6:bc88:2af7:3583%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 21:57:58 +0000
Date: Mon, 02 Mar 2026 16:57:56 -0500
Message-Id: <DGSMSOPS3RG0.3417SB071FTNC@silabs.com>
To: "Ayush Singh" <ayush@beagleboard.org>,
        "moderated list:GREYBUS
 SUBSYSTEM" <greybus-dev@lists.linaro.org>,
        "open list"
 <linux-kernel@vger.kernel.org>,
        "Johan Hovold" <johan@kernel.org>, "Alex
 Elder" <elder@kernel.org>,
        <linux-devel@silabs.com>, "Jason Kridner"
 <jkridner@beagleboard.org>,
        "Deepak Khatri" <lorforlinux@beagleboard.org>
From: =?utf-8?q?Damien_Ri=C3=A9gel?= <damien.riegel@silabs.com>
X-Mailer: aerc 0.21.0
References: <ecca8eb2-8e5a-4770-bcf6-3fb49773088b@beagleboard.org>
In-Reply-To: <ecca8eb2-8e5a-4770-bcf6-3fb49773088b@beagleboard.org>
X-ClientProxiedBy: YQZPR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::29) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|IA3PR11MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b97ea2-889f-478a-2df7-08de78a6c3ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	HLrpsNo9mL/Lunwb1pyOXDA1TjAR9CWvIIU2lt75MCYJsC2emgfCE0Vsykd9uszESq7A3r74/rEXYQ90gd7+PGg4zmtgp7QEZoWy0sJtoRyOeh2YZrEIXEzdlcNgsueaewxnYX3VSUR3FbnqixFW+JprutRUpSih9inE89qtO3vSUMNg/2D/2f2D/ZTRJ3TLrrPp1eADymqa8F2CmQCcZfObpsqwd/STfnPMz4YOIXdwlgKJYayetPUDpssz4H0KQ3HU80YdTJZ+AxxFk17Iq2yuhx2mUlPF8UGBAGhi9WCFdKTvcki+xPUtPsjSQu3SjHzTeRiXWfH7g1aA/fFDu0jZr8URckCfPOCGVQams1FSLADfsEt3eCme8Q8u0ZCwtNykC4qfhKx3LfjFZenqa67hgPFAQA/PBpS5EjMPFRiGXSvbh13cp6jHXLo6HugxW2GWCA1clwds5aRxs9OQQCPalb0VEu5bQ2ReVB1AiFGHxz5mpck3RiYma9KJsBPEaiUA+I4jKWC6Je1CFOnU/t3FOI9oFEBYF0uNK8CTv04FFsk9tpWzEt5/5kipqhGaHQ9pC2lC7BZ5XmT9wFRksUXpG7mOUOdcDvrYwIUxSceNyx1qmhy2eWNWzIbFFS3Gt0wVqds9P2myOIv8Kw3vLCXNWaHPE1iLNheeXy3c/B93mnUvJyWaVXLntsRe+/hStX5OUJ8azjPGaJXX+ao8Y8JboceOPd2OLAfU83Ny/4M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZStCSDdBcE5BRENURnpPa1A2ZHZNTG10TlU0KzVtUmNLZXFJZStNdHBSYzNw?=
 =?utf-8?B?Z3dLSWRBUHRHSG5NWGtHRjFpVVp3Rk8wUlU4a3ljK2FDYlEwNmNlQnJiUk5H?=
 =?utf-8?B?UkYyVVBPa3MwenhGMlYvT1k5WU1mQ2NUbW5JeXpsYlFxdXJPZXk1ZFFMbWNG?=
 =?utf-8?B?Qk1VbGRaV3BDbFhaRkhQQXk3UnJrM0dMc0JLOXBpNXl0bnZDU0lucGcwQzNl?=
 =?utf-8?B?ZlNGKzQxU0dkblR3TThoZWo3MHI2dWVlQ2dlSDNDcnJwdkFnS3pKVW1Gd2Zz?=
 =?utf-8?B?TU53cjlOdEIxMmZQZ2tqVCtsR2R6am93a2FWcHZQSk1BN3BVbEZFTFdRSml4?=
 =?utf-8?B?MHJ0dG9mM29HMkV0aHJiZ3ptUmx6N1h4cXBIY1diRVpXTnhkbE5qdmhUQUI5?=
 =?utf-8?B?UFgzbSsyc2pDMXp0Q1VJZU1GQ1M5bThRMS83Ynhhdk9vamU1QUljWUM2Q1lu?=
 =?utf-8?B?L28wclpxUyt6U29kbktBTUEwOVJGNERoTEROa1Z0MkxYbC9CL2NXaCszUiti?=
 =?utf-8?B?WHpoUGVWQzFjclNIMzN2Z1RqeVB1WEV2YlVtWGVFS3kxRmY0bVdIRnhJQnN3?=
 =?utf-8?B?N1d3cFZJZ0dqbjliVVNSeERrVGJrRnh4NzFNc3pFRHFBbjE2Z0tnQ1llbE9t?=
 =?utf-8?B?RzRqamNaWUhqeFlxeXFWMTZWdmNNcHJ0L1VlbVVuVUpNcE04cUUwVGZUYUVl?=
 =?utf-8?B?OXVXZ0pybmM3bjA0L25HY2Y0M2dEMjNoRTJjME95Wjc4NGVqVXNRUFp1S3Ev?=
 =?utf-8?B?bmZ4OTh5ekFDMVlMbkR0M0JURlpudUl5bnFzWklaQjhLV3dwVWJMckN0M0lp?=
 =?utf-8?B?RXNTUFJyT3liaCtCd2gxTU9MdGs5MG5HRWJ0STdFSkN0M2t3cWh6RGkyNm9N?=
 =?utf-8?B?bmJLNFJWd2VxMFJZeXBKRWFGWlV5dWFRcEpRWnZCbEh2VzZwQ3paYVh0dm9l?=
 =?utf-8?B?VGo1NUVpNHpXa25kOTF3MjhKYkQzMUswUjlyZGg3YUpPbEtuaExvOEtReEdw?=
 =?utf-8?B?Q2F2ejJVdTV0bWdCVkkwZlEzT1QwMjdRVmRZUFZDckt2T1ZHb1FoSDZLZnJS?=
 =?utf-8?B?T016UHIvUHNKU3I2QTBudVlCMkIxOE9LWjYwSWdvQjVJNWV6UTcrTXdWR1dB?=
 =?utf-8?B?QmpYZzN0WGQ3cmFDOCtTTU52ckdIaXJEQ0theGlIYUtVbnBkNVcyenhEQ2Rq?=
 =?utf-8?B?elUvcExNSFBBUEJZRGc3WldQaEFsanhiaDFQT2daalk2M0V0cGF1UDVGL3BD?=
 =?utf-8?B?ZUhlMTJ0ZlZ6UTJwaCtiQWRnaEppdGMzY0VZc1FYSkFEMzVMY2tZYWYvRks2?=
 =?utf-8?B?bFVkZG5aN3Z4SkozVzB0Qytyc1hRS0FpYXNpam9XOHpoSVQxdHdlT2EwUzJ5?=
 =?utf-8?B?R1hXQzBEaFEwRTFSUmNyUE42am9xdXdWTkZ6cEptbUJIY0N2eWtNQllRNlJD?=
 =?utf-8?B?Zmt3dUlrbVlnTkFlQ2dOT0NINk1PdGNIeDFKNnI5RjhlanB4QmNqQVYxeFpZ?=
 =?utf-8?B?RTRZUzVhcXpWNmNFMVN5VEwwMEFCQWcyMkRwMWJHclJTQWE3Umx0OGxaWEJl?=
 =?utf-8?B?ZmVpMFNST3lGOW12WnYvQWpHb0F2STFqWTBtaTRTOCtIVTJqcmFyQ2VxRFFR?=
 =?utf-8?B?eWxJTEdmSWpGc1ZrT2tONHFiczZCTkR6NWVrREwwWDZnZnJ5RFpDemMvTVJm?=
 =?utf-8?B?UStLY1JDbU1lUjlBOTlVWDFKaFMzYkMrWDcxUlQvSDAzNHAvNEV4dGw1Lzlp?=
 =?utf-8?B?eEZKT3lGVHd4Qk5kemdoRVZ1Y0tENG1XeUZXTnBqUE1tYktaaVp3VFQ2L05F?=
 =?utf-8?B?NFlCKzB1SWZJcjV3OVVLNVRlKy80UmRmbG9vMXp6RWgyVkg2UHR0TlMrZnU0?=
 =?utf-8?B?QW13b0dhWnNpTGxnMjlFVWdEc0pUNkU0M2x2cjdzYk9ENmpXb2xlek94aE5w?=
 =?utf-8?B?ZlpQR0pCL3pPMHFkcThLTitHeEJtYjE5RHVhdkpuL2NySmJUdDVDWWpKNFM1?=
 =?utf-8?B?dzZ6ajBiS3dGaWdjRTJFNitPak9BRUg5ODVMbWw0NlAyV0FJS2FHYXU1bGRh?=
 =?utf-8?B?Y1pWaVhIQ1hvN1k4Q1dqempzbDhaV2JMOURaQjZ3U1UxVVlzVG16WTMzUk9n?=
 =?utf-8?B?RGYzWjdLZnNsRlo0SjlrQkp2UjRsMVljZkdWYVBSTUFyTjRPK1BOSFVURitt?=
 =?utf-8?B?VG1lKzlIZUdiaHY3WVpKMDdhcGlsTUZYTUtOUVVkL0pFbFdkVWMvVVJRb2Rp?=
 =?utf-8?B?OGNvZEN0Q0oreC9uMC9xZU1rdE9aMkRhZFZHSjhaQ1NuVEpCaHBxNU1PZmFo?=
 =?utf-8?B?OFphbG5Da3hTKzRrSlVvTzl6NHcrTHV2V2FKTGFDK0lDQ0ZmeGJUQT09?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b97ea2-889f-478a-2df7-08de78a6c3ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:57:58.2221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuI+ppeRXRJRaJbIHUvteJCXxQNMk9O92OuE8WKTJ8L/rWSyvJE3Ccl6NHz8U8LwiuhZU2P29b6p1Rk0mIlUig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8920
X-Proofpoint-ORIG-GUID: oO5I-nICyHpMqHNsWi3AKBeH-GlQ5ab1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfX9BM2krH++DX+
 KQsqH4vY6ixI/4O3rNOiehjPlOezUhRonGJtm2y/f3fSZOIiZ9XtcSusPsbVUDgDYigtt/Ta2pZ
 GlKh0KLd2MSx2hUgSodcDAWCEY1s2BwnUC8++ijmavItjTkVRa0Sor0ZljsEP63GzShdmpl0XW/
 /tAS399xyaGV/3z+Il5/BTvk3QU2DEURmp/uNuZ3dW2THPbwpWMKnVZmEoQ87EU/AdmSqwzMO4g
 JGKL9nFP/Hcud6k/xHLHoOBBWwnyaffKZoadjCRfsqSpgBDSxF1XKyAHsYRPDapLojnajOldjYb
 fGUw61ndN9xEYZz3H2vjDMzh4T30GeD7ceIWSd9Q9WwqyRu2pGwyTUSQCMYjPs9KTe7YXyA+yZK
 CkaE0u2G3y8Ig3T4ACyEB0WEbH6Bb8OXRPTjzNDZk2nYvrZIeD2jiV+YGwSV2XMx4r58DjnQz/j
 eAzLfHCpoMG4NnOVTuQ==
X-Proofpoint-GUID: oO5I-nICyHpMqHNsWi3AKBeH-GlQ5ab1
X-Authority-Analysis: v=2.4 cv=Qd5rf8bv c=1 sm=1 tr=0 ts=69a607e9 cx=c_pps
 a=mu652P9qVXFiHaHDVbjfEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=buQUfWhnF1OtDDk5FV7I:22 a=qK0QUcPmHWA-PmoQ6YwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020164
X-Spamd-Bar: ----
X-MailFrom: prvs=1521e20967=damien.riegel@silabs.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: ANT2K3KJG5TXFCA4JTPJ25EXW27TBSRL
X-Message-ID-Hash: ANT2K3KJG5TXFCA4JTPJ25EXW27TBSRL
X-Mailman-Approved-At: Mon, 02 Mar 2026 22:32:27 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC] greybus: support combined Host + SVC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ANT2K3KJG5TXFCA4JTPJ25EXW27TBSRL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Queue-Id: 97C6C1E58F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[silabs.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[silabs.com:s=pps12202023,silabs.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[damien.riegel@silabs.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[silabs.com:-];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_HAM(-0.00)[-0.977];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[silabs.com:mid]
X-Rspamd-Action: no action

T24gU2F0IEZlYiAyOCwgMjAyNiBhdCA4OjQ3IEFNIEVTVCwgQXl1c2ggU2luZ2ggd3JvdGU6DQo+
IDIuIFNWQyBwZXIgbm9kZQ0KPg0KPiAgICAgRWFjaCBub2RlIGltcGxlbWVudHMgaXRzIG93biBT
VkMuIFNpbmNlIGFuIEnCskMgc2xhdmUgY2Fubm90IGluaXRpYXRlDQo+IGNvbW11bmljYXRpb24s
IHRoZSBBUCBtdXN0IGFscmVhZHkga25vdyB0aGUgYWRkcmVzcyBvZiBlYWNoIFNWQy9tb2R1bGUu
DQo+IFRoaXMgYWxzbyBzZWVtcyBpbmVmZmljaWVudCB3aGVuIGNoYWluaW5nIG11bHRpcGxlIG5v
ZGVzLg0KPg0KPiBbLi4uXQ0KPg0KPiAzLiBTVkMvQnJpZGdlIGZ1bmN0aW9uYWxpdHkgaW5zaWRl
IHRoZSBBUA0KPg0KPiAgICAgRm9yIHRoaXMgdXNlIGNhc2UsIHRoaXMgc2VlbXMgdG8gYmUgdGhl
IG1vc3QgcHJhY3RpY2FsIG9wdGlvbi4NCj4NCj4gICAgIFRvIGNsYXJpZnksIEkgYW0gbm90IHBy
b3Bvc2luZyBhbnkgbmV3IGRhdGEgcGF0aHMgaW4gdGhlIEdyZXlidXMNCj4gcGlwZWxpbmUuIFRo
ZSBpZGVhIGlzIHRvIGhhdmUgYSByZXVzYWJsZSBhbiBTVkMvYnJpZGdlIGltcGxlbWVudGF0aW9u
DQo+IHNpbWlsYXIgdG8gd2hhdCBleGlzdHMgaW4gZ3JleWJ1cy16ZXBoeXIgWzJdWzNdLCBidXQg
aG9zdGVkIHdpdGhpbiB0aGUgQVAuDQoNCldlIGRpc2N1c3NlZCBpbnRlcm5hbGx5IGF0IFNpbGlj
b24gTGFicyBvZiB0aGlzIHNvbHV0aW9uIHRvIGdldCByaWQgb2YNCnRoZSBTVkMgb24gdGhlIGRl
dmljZSBidXQgaGF2ZW4ndCBhY3R1YWxseSBpbXBsZW1lbnRlZCBpdCwgZ29vZCB0byBrbm93DQp0
aGF0IHdlIHdlcmUgbm90IGFsb25lLiBJIHRoaW5rIGl0J3MgYSBncmVhdCBhdmVudWUgdG8gZXhw
bG9yZSBiZWNhdXNlDQppdCBrZWVwcyBleGlzdGluZyBTVkMgY29kZSBhcyBpcywgc28gd2Uga2Vl
cCBhIHNpbmdsZSBkYXRhIHBhdGggaW4NCkdyZXlidXMnIGNvcmUgd2hpbGUgb2ZmZXJpbmcgdGhl
IGNhcGFiaWxpdHkgdG8gaGFuZGxlIFNWQyByZXF1ZXN0cyBvbg0KdGhlIGhvc3QuDQoNCkp1c3Qg
dG8gaGVscCBtZSBnZXQgYSBiZXR0ZXIgbWVudGFsIHBpY3R1cmUsIGluIGhkLT5tZXNzYWdlX3Nl
bmQgeW91DQp3b3VsZCBlaXRoZXIgaGFuZGxlIHRoZSBtZXNzYWdlIGltbWVkaWF0ZWx5IGlmIGNw
b3J0X2lkID09IDAsIG9yIGNvbnZlcnQNCnRoYXQgY3BvcnRfaWQgdG8gYW4gKGludGVyZmFjZSwg
aW50Zl9jcG9ydF9pZCkgYW5kIHBhc3MgdGhlIG1lc3NhZ2UgdG8NCnRoYXQgaW50ZXJmYWNlJ3Mg
Y3BvcnQsIHNvbWV0aGluZyBsaWtlIHRoYXQ/DQoNCiAgICBzdGF0aWMgaW50IG1lc3NhZ2Vfc2Vu
ZCguLi4sIHUxNiBjcG9ydF9pZCwgc3RydWN0IGdiX21lc3NhZ2UgKm1zZywgLi4uKQ0KICAgIHsN
CiAgICAJaWYgKGNwb3J0X2lkID09IEdCX1NWQ19DUE9SVF9JRCkgew0KICAgIAkJcmV0dXJuIHN2
Y19icmlkZ2VfaGFuZGxlX21zZyhtc2cpOw0KICAgIAl9IGVsc2Ugew0KICAgIAkJc3RydWN0IGNv
bm5lY3Rpb24gKmNvbm5lY3Rpb24gPSBzdmNfYnJpZGdlX2dldF9jb25uZWN0aW9uKGNwb3J0X2lk
KTsNCiAgICAJCS8vIC4uLiBvciB5b3UgY291bGQgZGlyZWN0bHkgbG9vayB1cCBpbiBoZC0+Y29u
bmVjdGlvbnMsDQogICAgCQkvLyB0aGUgd2hvbGUgbGlzdCBvZiBjb25uZWN0aW9ucyBpcyBhbHJl
YWR5IHRoZXJlLCBzbw0KCQkvLyBubyBuZWVkIHRvIG1haW50YWluIGFub3RoZXIgb25lIHNlcGFy
YXRlbHkNCg0KICAgIAkJLy8gc29tZXdob3cgY29udmVydCBjb25uZWN0aW9uLT5pbnRmIHRvIGFu
IGkyYyBhZGRyZXNzDQogICAgCQkvLyBhbmQgdXNlIGNvbm5lY3Rpb24tPmludGZfY3BvcnRfaWQg
dG8gYWRkcmVzcyB0aGUgY3BvcnQNCiAgICAJCWkyY190cmFuc2ZlcihhZGFwLCBtc2dzLCAxKTsN
CiAgICAJfQ0KICAgIH0NCg0KPiAgICAgYGBgDQo+ICAgICAgICAgKy0tLS0tLS0tLS0tLS0rICAg
ICAgICAgICAgICAgICstLS0tLS0tLS0tLSsNCj4gICAgICAgICB8IEFQIC8gU1ZDICAgIHwgPC0t
LSBJMkMgLS0tPsKgIHwgTW9kdWxlICAgIHwNCj4gICAgICAgICArLS0tLS0tLS0tLS0tLSsgICAg
ICAgICAgICAgICAgKy0tLS0tLS0tLS0tKw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fMKgICAgICAgICAgICAgKy0tLS0tLS0tLS0rDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBgLS0gSTJDIC0tLT7CoCB8IE1vZHVsZSAgfA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLSsNCj4g
ICAgIGBgYA0KDQpZb3UgbWVudGlvbiBpbiBwb2ludCAyIHRoYXQgaTJjIHNsYXZlcyBjYW5ub3Qg
aW5pdGlhdGUgY29tbXVuaWNhdGlvbiwgc28NCkkgd29uZGVyIGhvdyB5b3Ugd291bGQgZW11bGF0
ZSB0aGUgIk1PRFVMRV9JTlNFUlRFRCIgdGhhdCBmbG93cyBmcm9tIFNWQw0KdG8gdGhlIEFQLiBX
b3VsZCB5b3VyIEhEIHBvbGwgdGhlIGJ1cyBmb3IgY29ubmVjdGVkIG1vZHVsZXMgYW5kICJzZW5k
IiBhDQpNT0RVTEVfSU5TRVJURUQgZm9yIGVhY2ggb2YgdGhlbT8NCg0KQmVzaWRlcyB0aGF0LCBJ
IHRoaW5rIGl0IHdvdWxkIHdvcmsgZmluZS4gSSdsbCBiZSBoYXBweSB0byB0ZXN0IGFuZA0KcmV2
aWV3IHlvdXIgcGF0Y2ggd2hlbiByZWFkeS4NCg0KUmVnYXJkcywNCmRhbWllbg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
