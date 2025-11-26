Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCABC89C9A
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Nov 2025 13:34:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D0A1E3F80B
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Nov 2025 12:34:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 4D6973F80B
	for <greybus-dev@lists.linaro.org>; Wed, 26 Nov 2025 12:33:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=dY21IVgw;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8192601B2;
	Wed, 26 Nov 2025 12:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DAFC113D0;
	Wed, 26 Nov 2025 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764160436;
	bh=vK11l+bQCS22/e+ReutG0v5n0zLXde3DAy4MLpTtK1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dY21IVgwytYGjYPBdtyuLqpD1TeGHw1lwQJfRhfCCd/QXF6v8xrTJpuuVF8VYukTq
	 VyWEpjlPMx9IjRrVBK+aKMyfpo/NHfC108Jsegogmo2pTpdQS6W3kmCPJSGRhMif5L
	 VFb2NPjYTXiBcX+mfJuXE/lUh3h5kefIjoTCZ6LE=
Date: Wed, 26 Nov 2025 13:33:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2025112610-hankering-muscular-d120@gregkh>
References: <20251114150738.32426-1-damien.riegel@silabs.com>
 <DEHVQ7YAUOG8.2TPWJBM6MTXLT@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DEHVQ7YAUOG8.2TPWJBM6MTXLT@silabs.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4D6973F80B
X-Spamd-Bar: /
Message-ID-Hash: SCJQFA7AZHVCBWAQEXUQKYHNSI5F4OZ7
X-Message-ID-Hash: SCJQFA7AZHVCBWAQEXUQKYHNSI5F4OZ7
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org, Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC PATCH v2 00/12] greybus: introduce CPC as transport layer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SCJQFA7AZHVCBWAQEXUQKYHNSI5F4OZ7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 10:26:36AM -0500, Damien Ri=E9gel wrote:
> Hi Greg, Johan, and Alex,
>=20
> On Fri Nov 14, 2025 at 10:07 AM EST, Damien Ri=E9gel wrote:
> > Hi,
> >
> > This patchset brings support for Silicon Labs' CPC (Co-Processor
> > Communication) protocol as transport layer for Greybus. This is
> > introduced as a module that sits between Greybus and CPC Host Device
> > Driver implementations, like SDIO or SPI, which are not part of this
> > RFC. If there's no push back with this RFC, the final patchset ready for
> > upstream will include the SDIO driver.
>=20
> Gentle poke about this RFC, I would really appreciate any kind of
> feedback on it.

Given my workload, I don't respond to "RFC" as obviously it's not ready
for the submitter to feel that it should be applied yet :)

> If it's too big I can try to make it smaller to make the review easier.
> As we're committing to Greybus to enable the coexistence of different
> radio stacks in one chip, we want to make sure we're heading in the
> right direction and that our work has a chance to get upstreamed.

Always make review easier for us, so yes, please make it smaller!

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
