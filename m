Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58F769786
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jul 2023 15:26:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FED24417B
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jul 2023 13:26:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 6DDF93EF12
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jul 2023 13:26:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=GPgEMPEw;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07A7A61152;
	Mon, 31 Jul 2023 13:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD82BC433C8;
	Mon, 31 Jul 2023 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690809969;
	bh=/QZiC3g6TApWL+qcS3J0gTSn1BIbsvyZEOdwra+9ULI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPgEMPEwb7PGZ15rjOHJGgGRKnoxbbUMZiFzKppOBwJeWsmniOBzc53SuIW960l3e
	 BCBcMS1sDcvx3Fzqz2Dxf+QEtMA8ttGYiYORlUerevvmtcCPHEGGuvdZJ8F6cjWZ+n
	 HPBIKQG139bjSklVg1HBULX8t+YQRschacSbEu4I=
Date: Mon, 31 Jul 2023 15:26:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023073144-hardcore-dividing-e72d@gregkh>
References: <2023073032-hasty-crease-683a@gregkh>
 <20230730194752.32042-1-ayushdevel1325@gmail.com>
 <20230730194752.32042-2-ayushdevel1325@gmail.com>
 <2f05b9b6-58a4-87c5-9d8d-9869fa18cec1@ieee.org>
 <284a7f3a-caf3-6982-406a-92c10fcbf38f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <284a7f3a-caf3-6982-406a-92c10fcbf38f@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6DDF93EF12
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: U3BJV5EVTCALC47WDXIOME6DXXOZXDZU
X-Message-ID-Hash: U3BJV5EVTCALC47WDXIOME6DXXOZXDZU
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] greybus: es2: Remove extra newline
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U3BJV5EVTCALC47WDXIOME6DXXOZXDZU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Mon, Jul 31, 2023 at 06:28:25PM +0530, Ayush Singh wrote:
> Thanks, Alex Elder and Greg KH. I created the patch since I wanted to check
> out the whole git-send-email patch workflow and get better acquainted with
> things before submitting the beagle play greybus driver[1] I have been
> working on.

Again, you should try to get experience in the drivers/staging/*
subsystem first before branching out to other subsystems that might not
want checkpatch changes.

> I will probably ask a few questions pertaining to the driver organization
> over at kernelnewbies before creating a full patch for the driver.

You should work with your gsoc mentor on getting this cleaned up
properly to be submitted first, don't lean on the kernelnewbies
community for something that they should be helping out with :)

good luck!

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
