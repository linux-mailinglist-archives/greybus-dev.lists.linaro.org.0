Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F44816819
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Dec 2023 09:35:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1E9D043D1B
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Dec 2023 08:35:11 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id D1AB440D1F
	for <greybus-dev@lists.linaro.org>; Mon, 18 Dec 2023 08:35:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=cqKR6jTw;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B954AB80DED;
	Mon, 18 Dec 2023 08:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FCAC433C8;
	Mon, 18 Dec 2023 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702888506;
	bh=PvieyW9kHU+3JjdvRizTuAsBF+M7+DN21zt8QD6huP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqKR6jTwpmCKyTFqiDsud8Ud91Y2vl0XnJ70WkUUWsejg3N21krgNOC2hGTW6Sr//
	 PkugwCVTKDJbZBbTAjn2pZOtgeXLfIt4KhVQdagYFnoBeWEVHdgSDchIq1/IEoOYgz
	 UPhMPfMZofuUfwXr9yS3PhKhC0IHJypA2VlCOfPMF5X3opuQwu7Tnyq59gPlfhE2L7
	 BMOT1Z09reyctvlBiTybBEDPjQ60FLqs31RXDW6RG7gr4O0un4ilMkg7Cgrs/fszps
	 ppFsjdnc33uZ69wLfbVJFyRfIMVBseNo/FtnnrcNqwp53jB9iKEBeFsADcFruxnW5a
	 /8S2G6GLNLRGw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rF95c-0003FH-0v;
	Mon, 18 Dec 2023 09:35:05 +0100
Date: Mon, 18 Dec 2023 09:35:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Message-ID: <ZYAEOCMwZGMNvpNX@hovoldconsulting.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
 <ZXxa7yzKzG6048vw@francesco-nb.int.toradex.com>
 <ZXx8bCVyxJ9Ddvqm@hovoldconsulting.com>
 <ZXyH1Zv3Pxd6S3ag@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXyH1Zv3Pxd6S3ag@francesco-nb.int.toradex.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D1AB440D1F
X-Spamd-Bar: --
Message-ID-Hash: X3YV62MUMK7EBN7D7RCKRCL7RPRYODZJ
X-Message-ID-Hash: X3YV62MUMK7EBN7D7RCKRCL7RPRYODZJ
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X3YV62MUMK7EBN7D7RCKRCL7RPRYODZJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 15, 2023 at 06:07:33PM +0100, Francesco Dolcini wrote:

> On Fri, Dec 15, 2023 at 05:18:52PM +0100, Johan Hovold wrote:
> > On Fri, Dec 15, 2023 at 02:55:59PM +0100, Francesco Dolcini wrote:
> > > To me the change is correct, with that said probably this should have
> > > been explicitly mentioned in the commit message or a separate
> > > preparation patch.
> > 
> > It's a separate change and should not be hidden away in a tree-wide
> > change that goes through a different maintainer.
> > 
> > Please drop this change from this patch and resubmit it separately to me
> > if you want and I'll review when I have the time.
> 
> Fine, I agree.
> 
> I see those options (let me know if you see other options I have not
> mentioned):
> 
> 1. I add this change (taking into account also intel ice) as a separate
>    patch in this series and you may just ack it and Greg could merge
>    together with the serdev one.
> 2. I prepare an independent patch for the GNSS change and only once this
>    is merged I'll send a rebased v2 of this one.
> 3. I update this patch without this GNSS API change, that mean I will
>    have to cast away the signed type from a few GNSS drivers.
> 
> 1 is my preferred option, 2 is fine, but it seems a little bit of overdoing,
> 3 I would avoid, we are doing this cleanup to be a little bit more
> strongly typed and to prevent the kind of bugs that is the original trigger
> for this patch.

Changing the return type of gnss_insert_raw() is going to be a bit more
involved and should be done in a separate patch (e.g. you need to look
at gnss_usb_rx_complete() and ice_gnss_read() to avoid introducing new
warnings there).

And both option 2 and 3 will introduce conversion warnings (W=3, which
we have plenty of anyway) unless you add casts.

I suggest you go with 3, unless you insist on 2.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
