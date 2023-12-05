Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DD380432B
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Dec 2023 01:14:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 09E1A40C0C
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Dec 2023 00:14:25 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 261083EF7C
	for <greybus-dev@lists.linaro.org>; Tue,  5 Dec 2023 00:14:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=sDzOv3n3;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1ECF5B813DA;
	Tue,  5 Dec 2023 00:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EC5C433C8;
	Tue,  5 Dec 2023 00:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701735256;
	bh=fUrk4RiGbZxusBO78Ffl1INnFFomDcxaJChxDkyTxsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDzOv3n3qO2RWlXnBgEoNPZsMxpFJYweRElhiGiR1Pe7EBY8SF3GF/XQX60KZpHBy
	 yylKnunnvUteLRqUe/7YRhSW3/g437KDhnDn3Gc68uOpo/a1zAPoeg/z5HKZjnYn+t
	 MoPmGVB9A5409whVcoDoFIVc9fJqP2jCfDHRX7v0=
Date: Tue, 5 Dec 2023 09:14:12 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023120515-mongrel-undertook-6e5a@gregkh>
References: <20231204131008.384583-1-ayushdevel1325@gmail.com>
 <ZW3ePt-c4Mu43DOV@hovoldconsulting.com>
 <7ead544b-9234-483f-aacb-55ed05b01fa3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ead544b-9234-483f-aacb-55ed05b01fa3@gmail.com>
X-Rspamd-Queue-Id: 261083EF7C
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[intel.com:email,linaro.org:url,linuxfoundation.org:dkim,ams.source.kernel.org:rdns,ams.source.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: KEG74J5E4K5NA3Y42OJMLVCTI4ZD7PU6
X-Message-ID-Hash: KEG74J5E4K5NA3Y42OJMLVCTI4ZD7PU6
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V3] greybus: gb-beagleplay: Ensure le for values in transport
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KEG74J5E4K5NA3Y42OJMLVCTI4ZD7PU6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 04, 2023 at 09:58:55PM +0530, Ayush Singh wrote:
> 
> On 12/4/23 19:42, Johan Hovold wrote:
> > On Mon, Dec 04, 2023 at 06:40:06PM +0530, Ayush Singh wrote:
> > > Ensure that the following values are little-endian:
> > > - header->pad (which is used for cport_id)
> > > - header->size
> > > 
> > > Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
> > > Reported-by: kernel test robot <yujie.liu@intel.com>
> > > Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/
> > > Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> > > ---
> > > V3:
> > > - Fix endiness while sending.
> > > V2: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/L53UN5ROSG4M6OE7CU5Y3L5F44T6ZPCC/
> > > - Ensure endianess for header->pad
> > > V1: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K7UJ6PEAWBLNDMHLT2IO6OP5LQISHRUO/
> > > 
> > >   drivers/greybus/gb-beagleplay.c | 9 +++++----
> > >   1 file changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> > > index 43318c1993ba..8b21c3e1e612 100644
> > > --- a/drivers/greybus/gb-beagleplay.c
> > > +++ b/drivers/greybus/gb-beagleplay.c
> > > @@ -93,9 +93,9 @@ static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
> > >   	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
> > >   	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
> > > -		hdr->operation_id, hdr->type, cport_id, hdr->result);
> > > +		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
> > > -	greybus_data_rcvd(bg->gb_hd, cport_id, buf, len);
> > > +	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
> > This looks broken; a quick against mainline (and linux-next) check shows
> > cport_id to be u16.
> > 
> > I think you want get_unaligned_le16() or something instead of that
> > memcpy() above.
> Thanks, will do.
> > 
> > But that just begs the question: why has this driver repurposed the pad
> > bytes like this? The header still says that these shall be set to zero.
> 
> So, the reason is multiplexing. The original gbridge setup used to do this,
> so I followed it when I moved gbridge to the coprocessor (during GSoC).
> 
> Using the padding for storing cport information allows not having to wrap
> the message in some other format at the two transport layers (UART and TCP
> sockets) beagle connect is using.This also seems better than trying to do
> something bespoke, especially since the padding bytes are not being used for
> anything else.
> 
> The initial spec was for project Ara (modular smartphone), so the current
> use for IoT is significantly different from the initial goals of the
> protocol. Maybe a future version of the spec can be more focused on IoT, but
> that will probably only happen once it has proven somewhat useful in this
> space.

Please don't violate the spec today this way, I missed that previously,
that's not ok.  We can change the spec for new things if you need it,
but to not follow it, and still say it is "greybus" isn't going to work
and will cause problems in the long-run.

Should I just disable the driver for now until this is fixed up?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
