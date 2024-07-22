Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 980CD939002
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jul 2024 15:39:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6297743E83
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jul 2024 13:39:58 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	by lists.linaro.org (Postfix) with ESMTPS id 369163F3A3
	for <greybus-dev@lists.linaro.org>; Mon, 22 Jul 2024 09:10:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=marvell.com header.s=pfpt0220 header.b=dzmm2rB7;
	spf=pass (lists.linaro.org: domain of "prvs=4933257781=hkelam@marvell.com" designates 67.231.156.173 as permitted sender) smtp.mailfrom="prvs=4933257781=hkelam@marvell.com";
	dmarc=pass (policy=none) header.from=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46M7wtTW005443;
	Mon, 22 Jul 2024 02:10:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=UZ8qbwV8H5Uru+28S5SaGf9Al
	hy/rbNI7CI4WhPzKlU=; b=dzmm2rB7zo2tr5pLB+fubm3C4F6L+MIp6nF8GXX04
	iNvpNVXVUgJWJvk/hBTfDvo3Vg4tmnyR7vFcRV4//Gnk6jGloxEvfVMr+LG4jEEw
	wxSDKEUJCZM1rKOaGzn0hm/UkdpjRbr3pnDUuCHyR3iVl/6aGVoFhLc3lneECGd/
	TNYqYgoqztuERvV0GYvJt8y3e2A7AmA06dcOgZVQdrf4CtEsQX1QA0BXgMRjoTqw
	J25xtF2PNgH9FF56Vj0VYemw/a/WCVeW7297NaUk8soVQS7MPe96oPcYCET+HkS+
	L03Fssg9crdG1WBhbk6HsMuLkbydqsrbETSKCF6U12w8A==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 40hkgrr6yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 02:10:15 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 22 Jul 2024 02:10:15 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 22 Jul 2024 02:10:14 -0700
Received: from test-OptiPlex-Tower-Plus-7010 (unknown [10.29.37.157])
	by maili.marvell.com (Postfix) with SMTP id 971D73F7041;
	Mon, 22 Jul 2024 02:10:08 -0700 (PDT)
Date: Mon, 22 Jul 2024 14:40:07 +0530
From: Hariprasad Kelam <hkelam@marvell.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <Zp4h72rWwgnGmvcP@test-OptiPlex-Tower-Plus-7010>
References: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
 <20240719-beagleplay_fw_upgrade-v1-3-8664d4513252@beagleboard.org>
 <Zppeg3eKcKEifJNW@test-OptiPlex-Tower-Plus-7010>
 <b3269dc8-85ac-41d2-8691-0a70b630de50@lunn.ch>
 <e7e88268-a56b-447c-9d59-6a4eb8fcd25a@ieee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e7e88268-a56b-447c-9d59-6a4eb8fcd25a@ieee.org>
X-Proofpoint-ORIG-GUID: uf0FV3BztW2j4yQ85RZegmP76Gjj-a41
X-Proofpoint-GUID: uf0FV3BztW2j4yQ85RZegmP76Gjj-a41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_05,2024-07-18_01,2024-05-17_01
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 369163F3A3
X-Spamd-Bar: -
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[marvell.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[marvell.com:s=pfpt0220];
	R_SPF_ALLOW(-0.20)[+ip4:67.231.156.173];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FORGED_SENDER_VERP_SRS(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:22843, ipnet:67.231.156.0/24, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hkelam@marvell.com,prvs=4933257781=hkelam@marvell.com];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[checkpatch.pl:url,mx0b-0016f401.pphosted.com:helo,mx0b-0016f401.pphosted.com:rdns];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[marvell.com:+]
X-Rspamd-Action: no action
X-MailFrom: prvs=4933257781=hkelam@marvell.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AT5UV7WFG6E25AKQEVVCXD36SETRVUMS
X-Message-ID-Hash: AT5UV7WFG6E25AKQEVVCXD36SETRVUMS
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:39:53 +0000
CC: Andrew Lunn <andrew@lunn.ch>, Ayush Singh <ayush@beagleboard.org>, robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/3] greybus: gb-beagleplay: Add firmware upload API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AT5UV7WFG6E25AKQEVVCXD36SETRVUMS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On 2024-07-20 at 03:09:55, Alex Elder (elder@ieee.org) wrote:
> On 7/19/24 2:15 PM, Andrew Lunn wrote:
> > > >   drivers/greybus/Kconfig         |   1 +
> > > >   drivers/greybus/gb-beagleplay.c | 625 +++++++++++++++++++++++++++++++++++++++-
> > 
> > > > +static u8 csum8(const u8 *data, size_t size, u8 base)
> > > > +{
> > > > +	size_t i;
> > > > +	u8 sum = base;
> > > follow reverse x-mas tree
> > 
> > Since this is not networking, even thought it was posted to the netdev
> > list, this comment might not be correct. I had a quick look at some
> > greybus code and reverse x-mas tree is not strictly used.
> > 
> > Please see what the Graybus Maintainers say.
> 
> Andrew is correct.  The Greybus code does not strictly follow
> the "reverse christmas tree" convention, so there is no need
> to do that here.  Please understand that, while checkpatch.pl
> offers good and well-intentioned advice, not everything it
> warns about must be fixed, and in some cases it suggests things
> certain maintainers don't agree with.
> 
> 					-Alex
> 
> > 	Andrew
> 
> Ok got it. 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
