Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0F818CC7
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 17:48:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 095A33E925
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 16:48:01 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	by lists.linaro.org (Postfix) with ESMTPS id 0E8EB3F090
	for <greybus-dev@lists.linaro.org>; Fri, 15 Dec 2023 17:07:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of francesco@dolcini.it designates 217.194.8.81 as permitted sender) smtp.mailfrom=francesco@dolcini.it;
	dmarc=none
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id ADB5C20640;
	Fri, 15 Dec 2023 18:07:37 +0100 (CET)
Date: Fri, 15 Dec 2023 18:07:33 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <ZXyH1Zv3Pxd6S3ag@francesco-nb.int.toradex.com>
References: <20231214170146.641783-1-francesco@dolcini.it>
 <ZXxWX-Fw1InID2ax@hovoldconsulting.com>
 <ZXxa7yzKzG6048vw@francesco-nb.int.toradex.com>
 <ZXx8bCVyxJ9Ddvqm@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXx8bCVyxJ9Ddvqm@hovoldconsulting.com>
X-Rspamd-Queue-Id: 0E8EB3F090
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:217.194.8.64/26];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[dolcini.it,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:12637, ipnet:217.194.0.0/20, country:IT];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_RCPT(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DMARC_NA(0.00)[dolcini.it];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: francesco@dolcini.it
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CRJ3W3YEUQHNV4Y5E6WF3IIK3I2FWAZZ
X-Message-ID-Hash: CRJ3W3YEUQHNV4Y5E6WF3IIK3I2FWAZZ
X-Mailman-Approved-At: Tue, 19 Dec 2023 16:47:38 +0000
CC: Francesco Dolcini <francesco@dolcini.it>, Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob
  Herring <robh@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CRJ3W3YEUQHNV4Y5E6WF3IIK3I2FWAZZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Johan, Greg

On Fri, Dec 15, 2023 at 05:18:52PM +0100, Johan Hovold wrote:
> On Fri, Dec 15, 2023 at 02:55:59PM +0100, Francesco Dolcini wrote:
> > To me the change is correct, with that said probably this should have
> > been explicitly mentioned in the commit message or a separate
> > preparation patch.
> 
> It's a separate change and should not be hidden away in a tree-wide
> change that goes through a different maintainer.
> 
> Please drop this change from this patch and resubmit it separately to me
> if you want and I'll review when I have the time.

Fine, I agree.

I see those options (let me know if you see other options I have not
mentioned):

1. I add this change (taking into account also intel ice) as a separate
   patch in this series and you may just ack it and Greg could merge
   together with the serdev one.
2. I prepare an independent patch for the GNSS change and only once this
   is merged I'll send a rebased v2 of this one.
3. I update this patch without this GNSS API change, that mean I will
   have to cast away the signed type from a few GNSS drivers.

1 is my preferred option, 2 is fine, but it seems a little bit of overdoing,
3 I would avoid, we are doing this cleanup to be a little bit more
strongly typed and to prevent the kind of bugs that is the original trigger
for this patch.

What would you Greg and Johan prefer?


> And when doing tree-wide changes, please try to follow the style of the
> driver you are changing (e.g. do not introduce inconsistencies by
> changing to open parenthesis alignment of continuation lines in code
> that do not use it).

ack, sorry about that, looking back at the archive is seems a recent
pain point, also Jiri fell in this trap.

Francesco

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
