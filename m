Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE07D966F
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Oct 2023 13:21:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB6D1401EF
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Oct 2023 11:21:45 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 267083EFDC
	for <greybus-dev@lists.linaro.org>; Fri, 27 Oct 2023 11:21:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=xbnhr18r;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 22047CE4465;
	Fri, 27 Oct 2023 11:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED017C433C7;
	Fri, 27 Oct 2023 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698405695;
	bh=O3+98i6Qehz5V/whtfKsxgGTIVPdpkvjDfNY7d71FEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xbnhr18rvCnOQ72NPcTn0TdfHoKPWMYsJmojn6+tKMXaQh0Dz2hyOufqk/qt7iDuT
	 XjnLnWtgQxx8Wm4Vak4jtpOru7fA2LH9FO99mntEAFEx7UCdNa5Fw64A5iVIRP3e5y
	 yHuajDtJA3EggouiVqVwqFMqe28YFthoxmI3NMZc=
Date: Fri, 27 Oct 2023 13:21:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023102701-safely-limping-0c26@gregkh>
References: <20231017101116.178041-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017101116.178041-1-ayushdevel1325@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 267083EFDC
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	RCPT_COUNT_SEVEN(0.00)[8];
	URIBL_BLOCKED(0.00)[linaro.org:url,beagleboard.org:url];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: **
Message-ID-Hash: L2EMHATHLT5OXUDSOQLBYW622BE4KJDG
X-Message-ID-Hash: L2EMHATHLT5OXUDSOQLBYW622BE4KJDG
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v9 0/3] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L2EMHATHLT5OXUDSOQLBYW622BE4KJDG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 17, 2023 at 03:41:11PM +0530, Ayush Singh wrote:
> BeagleConnect is both a technology concept and a line of board designs
> that implement the technology. Born from Greybus, a mechanism for
> dynamically extending a Linux system with embedded peripherals,
> BeagleConnect adds two key elements: a 6LoWPAN transport and mikroBUS
> manifests. The 6LoWPAN transport provides for arbitrary connections,
> including the IEEE802.15.4g long-range wireless transport supported
> between BeaglePlay and BeagleConnect Freedom (the first BeagleConnect
> board design). The mikroBUS manifests provide for rapid prototyping
> and low-node-count production with sensor boards following the
> mikroBUS freely-licensable embedded bus standard such that existing
> Linux drivers can be loaded upon Greybus discovery of the nodes.
> This patch set provides the Linux-side hooks required for the 6LoWPAN
> transport for BeagleConnect on BeaglePlay. Also adds required devicetree
> additions.
> 
> Tested over `next-20230825`.
> 
> Link: https://programmershideaway.xyz/tags/gsoc23/ GSoC23 Blog
> Link: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware Zephyr App
> Link: https://github.com/Ayush1325/linux/tree/gb-beagleplay GitHub Branch
> Link: https://docs.beagleboard.org/latest/boards/beagleconnect/index.html BeagleConnect
> Link: https://docs.beagleboard.org/latest/boards/beagleplay/index.html BeaglePlay
> Link: https://github.com/Ayush1325/linux/tree/gb-beagleplay Github Repo
> Link: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/5RQV7OG5KI4BQWRN5ZCGZIFRMM6ERKPP/ Patch v8
> 
> Changes in Patch v9
> v8 -> v9:
> - Some capitalization in dt-bindings
> - add reset-gpios and vdds-supply to beagleplay device tree

Given a lack of objections, and nothing I could find wrong with this,
I've now applied this to my tree, thanks for sticking with this.

Now the real work begins!  :)

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
