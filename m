Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B43E523CAE9
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 15:15:09 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D6BB8610EE
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 13:15:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BB7E26601F; Wed,  5 Aug 2020 13:15:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 873656601C;
	Wed,  5 Aug 2020 13:14:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B47F560D73
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 13:14:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 97F4D6192C; Wed,  5 Aug 2020 13:14:50 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by lists.linaro.org (Postfix) with ESMTPS id 4B3A160D73
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 13:14:49 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id a5so30566792ioa.13
 for <greybus-dev@lists.linaro.org>; Wed, 05 Aug 2020 06:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5NGswowN9lNt0B7Qm7pFhGL8MlFG4CkHrirwlJK6xy4=;
 b=hZF6RgUlsN+ku1EQVHmh58hZLHOMPQGZ7ttmDvwDtBGolBq0NEW7KgFiqjppeCwoiG
 9QnwwS6gnCjP0acqBWNcjoBw0nkoGWd8zkF29EDdbarFArlcgTXX0RpIfX7yvw3qblk7
 hWddND0bEBZwC9h5YNoxp57CjoYKaukwJvy3x1a3LfAn1et7r5cXyeN46TRA77t42ck5
 oZI+VQz9Q5sKHhXKu01hIHkp4ZBPkEoOSJ6kdSgnSxddIGMhHwQEnquvTJZLgb7KBN0r
 w+hcWQ+vwK/y3UqEHaB0vzEOabtUjEcd4f47W3NDi0rcGENBm7GLp1NFdVpSKQ3wTl5h
 odNw==
X-Gm-Message-State: AOAM530eTngQnu5DoQ5JSm1frnV/WbNKiJgOeK8kaSrCj4/qqn5pNIHn
 XCoRiotZbhr2a+npZ02ZNdVuLg==
X-Google-Smtp-Source: ABdhPJyiMBH7gV9Zc6QUzz25ejAv4noYllQlkHa87ohih1OIFGenFVCFdfiA/UVUi0O1y1XyGOrqPQ==
X-Received: by 2002:a5d:91d4:: with SMTP id k20mr3407822ior.9.1596633288660;
 Wed, 05 Aug 2020 06:14:48 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id y8sm1003253iom.26.2020.08.05.06.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 06:14:47 -0700 (PDT)
From: Alex Elder <elder@ieee.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200727183258.GA28571@embeddedor>
 <63871608-e076-26b0-85df-cff11699c3a3@ieee.org>
Message-ID: <e36013ba-e19a-86c9-cb68-d7ad5559c292@ieee.org>
Date: Wed, 5 Aug 2020 08:14:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <63871608-e076-26b0-85df-cff11699c3a3@ieee.org>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH][next] greybus: Use fallthrough
	pseudo-keyword
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gNy8yOC8yMCA1OjM3IFBNLCBBbGV4IEVsZGVyIHdyb3RlOgo+IE9uIDcvMjcvMjAgMTozMiBQ
TSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPj4gUmVwbGFjZSB0aGUgZXhpc3RpbmcgLyog
ZmFsbCB0aHJvdWdoICovIGNvbW1lbnRzIGFuZCBpdHMgdmFyaWFudHMgd2l0aAo+PiB0aGUgbmV3
IHBzZXVkby1rZXl3b3JkIG1hY3JvIGZhbGx0aHJvdWdoWzFdLgo+Pgo+PiBbMV0gaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS43L3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sP2hpZ2hs
aWdodD1mYWxsdGhyb3VnaCNpbXBsaWNpdC1zd2l0Y2gtY2FzZS1mYWxsLXRocm91Z2gKPiAKPiBU
aGFua3MgZm9yIHRoZSBwYXRjaC7CoCBJdCBsb29rcyBnb29kLCBidXQgaXQgcmFpc2VzCj4gYW5v
dGhlciBxdWVzdGlvbiBJJ2QgbGlrZSBkaXNjdXNzaW9uIG9uLgoKSXQncyBiZWVuIGEgd2Vlaywg
YW5kIHdlIGhlYXJkIGJhY2sgZnJvbSBWaXJlc2ggKGFuZCBKb2UpIG9uCnRoaXMsIGJ1dCBubyBv
bmUgZWxzZS4gIFZpcmVzaCBsZWZ0IG91dCB0aGUgYnJlYWsgc3RhdGVtZW50IG9uCnRoZSBsYXN0
IGNhc2Ugb2YgdGhlIHN3aXRjaCBzdGF0ZW1lbnQgaW50ZW50aW9uYWxseSwgYXJndWluZwp0aGF0
IGl0IGlzIG5vdCBuZWVkZWQgKG11Y2ggbGlrZSBhIHJldHVybiBzdGF0ZW1lbnQgYXQgdGhlIGVu
ZApvZiBhIHZvaWQgZnVuY3Rpb24pLiAgQnV0IGhlIGRvZXNuJ3QgZmVlbCBzdHJvbmdseSBlbm91
Z2gKaW5zaXN0IGl0IHNob3VsZCBzdGF5IHRoYXQgd2F5LiAgSSdtIHN1cmUgdGhlIG90aGVycyBv
bWl0dGVkCnRoZSBicmVhayBzdGF0ZW1lbnQgaW50ZW50aW9uYWxseSBhcyB3ZWxsLgoKR2l2ZW4g
bm8gc3Ryb25nIHB1c2hiYWNrLCBJJ2xsIGFzayB5b3UgKEd1c3Rhdm8pIHRvIHBvc3QgYQpzZWNv
bmQgcGF0Y2ggYWRkaW5nIHRoZSBtaXNzaW5nIGJyZWFrIHN0YXRlbWVudHMgSSBkZXNjcmliZWQK
KGFuZCBsb29rIGZvciBhbnkgb3RoZXJzIEkgbWlnaHQgaGF2ZSBtaXNzZWQpLiAgSWYgeW91IHdv
dWxkCnByZWZlciBub3QgdG8gZG8gdGhhdCwganVzdCBzYXkgc28sIGFuZCBJIHdpbGwgc2VuZCBv
dXQgc3VjaAphIHBhdGNoIG15c2VsZi4KCk9uIHlvdXIgb3JpZ2luYWwgcGF0Y2gsIGl0IGxvb2tz
IGdvb2QgdG8gbWUuICBUaGFuayB5b3UuCgpSZXZpZXdlZC1ieTogQWxleCBFbGRlciA8ZWxkZXJA
bGluYXJvLm9yZz4KCj4gSXQgc2VlbXMgdGhhdCBKb2hhbiBsaWtlcyBkZWZhdWx0IChvciBmaW5h
bCkgY2FzZXMgaW4KPiBzd2l0Y2ggc3RhdGVtZW50cyB3aXRob3V0IGEgImJyZWFrIiBzdGF0ZW1l
bnQuwqAgVmlyZXNoCj4gYW5kIEJyeWFuIGFwcGVhciB0byBiZSBmb25kIG9mIHRoaXMgdG9vLgo+
IAo+IEl0J3MgcGVkYW50aWMsIGJ1dCBJIGRvbid0IGxpa2UgdGhhdC7CoCBBbSBJIHdyb25nPwo+
IMKgIC0tPiBKb2hhbi9WaXJlc2gvQnJ5YW4gd291bGQgeW91IHBsZWFzZSBjb21tZW50Pwo+IAo+
IElmIHRoZXkgYXJlbid0IGNvbnZpbmNpbmcgKG9yIGRvbid0IGNhcmUpIEkgdGhpbmsgYnJlYWsK
PiBzdGF0ZW1lbnRzIHNob3VsZCBhbHNvIGJlIGFkZGVkIGhlcmU6Cj4gLSBJbiBnYl9pbnRlcmZh
Y2VfcmVhZF9hbmRfY2xlYXJfaW5pdF9zdGF0dXMoKSBmb3IgdGhlCj4gwqAgZGVmYXVsdCBjYXNl
Cj4gLSBJbiBnYl9pbnRlcmZhY2VfYWN0aXZhdGUoKSBmb3IgdGhlIGRlZmF1bHQgY2FzZS4KPiAt
IEluIGdiX3N2Y19wcm9jZXNzX2RlZmVycmVkX3JlcXVlc3QoKSBmb3IgdGhlIGRlZmF1bHQKPiDC
oCBjYXNlCj4gCj4gQnV0IGxldCdzIHdhaXQgdG8gc2VlIHdoYXQgSm9oYW4gKGV0IGFsKSBzYXlz
LsKgIElmIHlvdQo+IGRvbid0IHdhbnQgdG8gZG8gdGhhdCwgc2F5IHNvIGFuZCBJJ2xsIGRvIGl0
IGxhdGVyLgo+IAo+IEkgbG9va2VkIGF0IHRoZSBjb2RlIGluIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzLyBhbmQgc2F3Cj4gbm8gbmVlZCB0byBhZGQgYSAiZmFsbHRocm91Z2giIGFueXdoZXJlLCBi
dXQ6Cj4gLSBJbiBmd19tZ210X2JhY2tlbmRfZndfdmVyc2lvbl9vcGVyYXRpb24oKSBWaXJlc2gK
PiDCoCBzZWVtcyB0byBoYXZlIHNraXBwZWQgdGhlIGJyZWFrIGluIHRoZSBmYXVsdCBzdGF0ZW1l
bnQKPiAtIEluIGdiX3VhcnRfcmVxdWVzdF9oYW5kbGVyKCkgQnJ5YW4gZGlkIHRoaXMgdG9vLgo+
IAo+IERlcGVuZGluZyBvbiBkaXNjdXNzaW9uLCB0aGVzZSBjb3VsZCBiZSBmaXhlZCBpbiBhCj4g
c2VwYXJhdGUgcGF0Y2ggYXMgd2VsbC4KPiAKPiBUaGVzZSBjYXNlcyBhcmVuJ3QgZm91bmQgYnkg
ImNoZWNrcGF0Y2gucGwiIGJlY2F1c2UgaXQgb25seQo+IGxvb2tzIGF0IGNhc2UgImJsb2NrcyIg
dGhhdCBhcmUgZm9sbG93ZWQgYnkgYW5vdGhlciBjYXNlLgo+IFNvIHRoZSBsYXN0IGNhc2UgaXNu
J3QgY2hlY2tlZC4KPiAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAt
QWxleAo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJz
QGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dyZXlidXMvZXMyLmPCoMKgwqDCoMKg
wqAgfCAyICstCj4+IMKgIGRyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYyB8IDIgKy0KPj4gwqAg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvZXMyLmMgYi9kcml2ZXJzL2dyZXlidXMvZXMyLmMK
Pj4gaW5kZXggMzY2NzE2ZjExYjFhLi4xZGY2YWI1ZDMzOWQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvZ3JleWJ1cy9lczIuYwo+PiArKysgYi9kcml2ZXJzL2dyZXlidXMvZXMyLmMKPj4gQEAgLTc1
OSw3ICs3NTksNyBAQCBzdGF0aWMgaW50IGNoZWNrX3VyYl9zdGF0dXMoc3RydWN0IHVyYiAqdXJi
KQo+PiDCoMKgwqDCoMKgIGNhc2UgLUVPVkVSRkxPVzoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRl
dl9lcnIoZGV2LCAiJXM6IG92ZXJmbG93IGFjdHVhbCBsZW5ndGggaXMgJWRcbiIsCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZnVuY19fLCB1cmItPmFjdHVhbF9sZW5ndGgpOwo+PiAt
wqDCoMKgwqDCoMKgwqAgLyogZmFsbCB0aHJvdWdoICovCj4+ICvCoMKgwqDCoMKgwqDCoCBmYWxs
dGhyb3VnaDsKPj4gwqDCoMKgwqDCoCBjYXNlIC1FQ09OTlJFU0VUOgo+PiDCoMKgwqDCoMKgIGNh
c2UgLUVOT0VOVDoKPj4gwqDCoMKgwqDCoCBjYXNlIC1FU0hVVERPV046Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dyZXlidXMvaW50ZXJmYWNlLmMgYi9kcml2ZXJzL2dyZXlidXMvaW50ZXJmYWNl
LmMKPj4gaW5kZXggNjdkYmU2ZmRhOWExLi41OGVhMzc0ZDhhYWEgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYwo+PiArKysgYi9kcml2ZXJzL2dyZXlidXMvaW50ZXJm
YWNlLmMKPj4gQEAgLTEyMzMsNyArMTIzMyw3IEBAIGludCBnYl9pbnRlcmZhY2VfYWRkKHN0cnVj
dCBnYl9pbnRlcmZhY2UgKmludGYpCj4+IMKgwqDCoMKgwqAgY2FzZSBHQl9JTlRFUkZBQ0VfVFlQ
RV9HUkVZQlVTOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8oJmludGYtPmRldiwgIkdN
UCBWSUQ9MHglMDh4LCBQSUQ9MHglMDh4XG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGludGYtPnZlbmRvcl9pZCwgaW50Zi0+cHJvZHVjdF9pZCk7Cj4+IC3CoMKgwqDCoMKgwqDC
oCAvKiBmYWxsLXRocm91Z2ggKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGZhbGx0aHJvdWdoOwo+PiDC
oMKgwqDCoMKgIGNhc2UgR0JfSU5URVJGQUNFX1RZUEVfVU5JUFJPOgo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgZGV2X2luZm8oJmludGYtPmRldiwgIkREQkwxIE1hbnVmYWN0dXJlcj0weCUwOHgsIFBy
b2R1Y3Q9MHglMDh4XG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGYtPmRk
YmwxX21hbnVmYWN0dXJlcl9pZCwKPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2dyZXlidXMtZGV2Cg==
