Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056C815837
	for <lists+greybus-dev@lfdr.de>; Sat, 16 Dec 2023 08:20:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0FECB43D3B
	for <lists+greybus-dev@lfdr.de>; Sat, 16 Dec 2023 07:20:01 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 2A9603EFFA
	for <greybus-dev@lists.linaro.org>; Sat, 16 Dec 2023 07:19:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=xBwjmUEm;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 123C0B8224A;
	Sat, 16 Dec 2023 07:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18524C433C8;
	Sat, 16 Dec 2023 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702711195;
	bh=g1hqMgI8g1l74P0c+B7FgDGA+41wsHf4KclcSInh/k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xBwjmUEmjk4kcqt0RllDOAmBNmKEfL0b0TlmmfH/Ud1VwdUmym+1W3xYaQkuwRkQm
	 dCrMrUorZaXybE4I3TYcUEXjfg/H/gOvJ5tSjnu836mw/aJwPgmIB4cyOuNuskfAWg
	 xou3sGEnfP0Se87X/sJbUZ0J/vEO04NltMNimtsY=
Date: Sat, 16 Dec 2023 08:19:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023121616-depict-unloving-525b@gregkh>
References: <20231211065420.213664-1-ayushdevel1325@gmail.com>
 <20231211065420.213664-2-ayushdevel1325@gmail.com>
 <2023121559-overfed-kisser-3923@gregkh>
 <e60f7697-1a1a-46a4-9def-b59cae9777a3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e60f7697-1a1a-46a4-9def-b59cae9777a3@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2A9603EFFA
X-Spamd-Bar: ---
Message-ID-Hash: RQRFGJIUFFFGJYZXFJPP7BBOEZW3USAP
X-Message-ID-Hash: RQRFGJIUFFFGJYZXFJPP7BBOEZW3USAP
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V2 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RQRFGJIUFFFGJYZXFJPP7BBOEZW3USAP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 16, 2023 at 05:39:30AM +0530, Ayush Singh wrote:
> On 12/15/23 21:50, Greg KH wrote:
> 
> > On Mon, Dec 11, 2023 at 12:24:18PM +0530, Ayush Singh wrote:
> > > Make gb-beagleplay greybus spec compliant by moving cport information to
> > > transport layer instead of using `header->pad` bytes.
> > > 
> > > Greybus HDLC frame now has the following payload:
> > > 1. le16 cport
> > > 2. gb_operation_msg_hdr msg_header
> > > 3. u8 *msg_payload
> > > 
> > > Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
> > > Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> > > ---
> > >   drivers/greybus/gb-beagleplay.c | 55 ++++++++++++++++++++++++---------
> > >   1 file changed, 41 insertions(+), 14 deletions(-)
> > This doesn't apply against my char-misc-next branch at all, what did you
> > generate it against?
> > 
> > thanks,
> > 
> > greg k-h
> 
> The base commit of my tree is `0f5f12ac05f36f117e793656c3f560625e927f1b`.
> The tag is `next-20231205`.
> 
> I can rebase to a newer tag if you wish.

Please rebase on the char-misc-next branch otherwise I can not take it.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
