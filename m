Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A7BD3314D
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Jan 2026 16:11:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D8A73401B2
	for <lists+greybus-dev@lfdr.de>; Fri, 16 Jan 2026 15:11:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id C827A3F6DD
	for <greybus-dev@lists.linaro.org>; Fri, 16 Jan 2026 15:11:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=a9U27txV;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16B72440A6;
	Fri, 16 Jan 2026 15:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0B8C116C6;
	Fri, 16 Jan 2026 15:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768576285;
	bh=FEYjuM8i1NFEkihMu32S8TQoBYIUYsQIt52CZXdmSCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9U27txVmMJHIbEcVPwCWn8fmZnwASrk260XJ6gyu8vHbgrPPCnL/niP0/N6iKiA5
	 zgccbB/wXL68iWhSRoOIeFHqgnZGdBeNB5Sl1X4JT3uJkiGiPtL+J00yWgJM8l0dwB
	 8PbajcO9maG9iplZdoQ2DIrtrmtJkilHlA48dp1o=
Date: Fri, 16 Jan 2026 16:11:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2026011639-prewar-drilling-9bc9@gregkh>
References: <20260115155808.36102-1-damien.riegel@silabs.com>
 <20260115155808.36102-2-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115155808.36102-2-damien.riegel@silabs.com>
X-Rspamd-Queue-Id: C827A3F6DD
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime,gregkh:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: X42LKSPBLN6L5OV6XVXNFLI5KY2D4TIU
X-Message-ID-Hash: X42LKSPBLN6L5OV6XVXNFLI5KY2D4TIU
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org, Silicon Labs Kernel Team <linux-devel@silabs.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 01/14] greybus: cpc: add minimal CPC Host Device infrastructure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X42LKSPBLN6L5OV6XVXNFLI5KY2D4TIU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 10:57:54AM -0500, Damien Ri=E9gel wrote:
> As the first step for adding CPC support with Greybus, add a very
> minimal module for CPC Host Devices. For now, this module only proxies
> calls to the Greybus Host Device API and does nothing useful, but
> further commits will use this base to add features.

What is "CPC"?  I don't see a description of that anywhere here, sorry.

> +config GREYBUS_CPC
> +	tristate "Greybus CPC driver"
> +	help
> +	  Select this option if you have a Silicon Labs device that acts as a
> +	  Greybus SVC.

What type of device is that?  And again, what is "CPC"?  Specifics are
good to add here.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
