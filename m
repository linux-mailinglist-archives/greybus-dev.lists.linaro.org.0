Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9212287DD75
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 15:42:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3F4AE451C2
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 14:41:59 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lists.linaro.org (Postfix) with ESMTPS id 374573F387
	for <greybus-dev@lists.linaro.org>; Sun, 17 Mar 2024 14:41:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=lunn.ch header.s=20171124 header.b=alCHLXnX;
	dmarc=pass (policy=none) header.from=lunn.ch;
	spf=pass (lists.linaro.org: domain of andrew@lunn.ch designates 156.67.10.101 as permitted sender) smtp.mailfrom=andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nFaY47Y/DXxkjFbRQx1XtsLzmqfV/DOsE2eb/gKgyLw=; b=alCHLXnXhxvDpn11JZsvx5Uaxq
	dT4XcGlS14H0VQkoKpBSwWGxx1s3wOyeA5xKUyYI3IExpOEYiU1inILgxyJa0Reb4d6roXjWByRUT
	c/xN/HER0g/vorEWEKbx2i2lBFS26dBtbvnJGDPcrsX0G6CEbgIhhDGpn7ponT2xs4Bg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rlrhd-00AXxp-4q; Sun, 17 Mar 2024 15:41:33 +0100
Date: Sun, 17 Mar 2024 15:41:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <0a0a6e14-ac7b-48fd-89d3-68f351e893c9@lunn.ch>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <CALudOK5v_uCUffxHGKS-jA-DKLNV7xwmKkxJwjHaMWWgDdPDqA@mail.gmail.com>
 <656ca446-9e56-4879-bb42-cd29063e0a82@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <656ca446-9e56-4879-bb42-cd29063e0a82@gmail.com>
X-Rspamd-Queue-Id: 374573F387
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.40 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	ASN(0.00)[asn:58222, ipnet:156.67.8.0/22, country:CH];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[beagleboard.org,vger.kernel.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: Z3LZN3TP3TBGVBXP6FK6Z47IIXKTWJS5
X-Message-ID-Hash: Z3LZN3TP3TBGVBXP6FK6Z47IIXKTWJS5
X-MailFrom: andrew@lunn.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaishnav M A <vaishnav@beagleboard.org>, linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 0/8] misc: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z3LZN3TP3TBGVBXP6FK6Z47IIXKTWJS5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Yes, I will add Co-author and Co-developed tags. I think I should use your
> ti email? I would have preferred to keep you as the author in the git commit
> but I could not get the patches applied cleanly back when I tried it.

Probably not required now, but

git commit --amend --author A U Thor <author@example.com>

allows you to change the author of a patch in git.

       Andrew
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
